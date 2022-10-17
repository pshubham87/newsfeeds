import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final imageUrl, title, subtitle, time;

  const HomePageCard({key, this.imageUrl, this.title, this.time, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 203,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
              ),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fill),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black.withOpacity(0.33),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        maxLines: 3,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(title,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
