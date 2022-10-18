import 'package:feed/backend/rss_to_json.dart';
import 'package:flutter/material.dart';
import 'screens/home/homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  Map<String, List> newsData = Map<String, List>();
  bool isLoading = true;
  getData() async {
    Future.wait([
      rssToJson('topnews'),
      rssToJson('world-news'),
      rssToJson('business'),
      rssToJson('sports'),
      rssToJson('cricket'),
      rssToJson('education'),
      rssToJson('entertainment'),
      rssToJson('lifestyle'),
      rssToJson('health'),
      rssToJson('trending'),
    ]).then((value) {
      value.forEach((element) {
        value[0].addAll([...element]);
      });
      value[0].shuffle();
      newsData['topnews'] = value[0];
      newsData['world'] = value[1];
      newsData['business'] = value[2];
      newsData['sports'] = value[3];
      newsData['cricket'] = value[4];
      newsData['education'] = value[5];
      newsData['entertainment'] = value[6];
      newsData['lifestyle'] = value[7];
      newsData['health'] = value[8];
      newsData['its-viral'] = value[9];
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Text("Null")
          : <Widget>[
              HomePage(
                newsData: newsData,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ][currentIndex],
    );
  }
}
