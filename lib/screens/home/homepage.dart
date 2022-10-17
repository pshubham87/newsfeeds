// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../../model/categories_model.dart';
import '../../reusable/custom_cards.dart';

class HomePage extends StatefulWidget {
  final Map<String, List> newsData;

  const HomePage({key, required this.newsData}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  int currentIndex = 0;
  Map<String, List> _newsData = Map<String, List>();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: categories.length, vsync: this);
    setState(() {
      _newsData = Map.from(widget.newsData);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 25, 25),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 190,
                        child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/previews/002/427/780/large_2x/simple-mountain-black-logo-icon-illustration-design-vector.jpg")),
                      ),
                      Text(
                        "Edification",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Times",
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: EdgeInsets.only(right: 15),
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  tabs: List.generate(categories.length,
                      (index) => Text(categories[index].name))),
            ),
          ),
        ];
      },
      body: Container(
        child: TabBarView(
            controller: _tabController,
            children: List.generate(
              categories.length,
              (index) {
                var key = categories[index]
                    .imageUrl
                    .toString()
                    .split("/")[3]
                    .split(".")[0]
                    .replaceAll("_", "-");
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  itemBuilder: (context, i) {
                    return HomePageCard(
                      title: widget.newsData[key]![i]['title']['__cdata'],
                      subtitle: widget.newsData[key]![i]['description']
                          ['__cdata'],
                      imageUrl: widget.newsData[key]![i]['media\$content']
                          ['url'],
                    );
                  },
                  itemCount: widget.newsData[key]?.length ?? 0,
                );
              },
            )),
      ),
    );
  }
}
