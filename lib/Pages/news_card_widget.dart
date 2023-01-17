import 'package:flutter/material.dart';
import 'package:news_api/Pages/full_news_view.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String linkUrl;
  final String imgUrl;
  final String publishedTime;
  const NewsCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.linkUrl,
      required this.imgUrl,
      required this.publishedTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => NewsView(
                            link: linkUrl,
                          ))));
            },
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(.60),
                        spreadRadius: -6.0,
                        offset: Offset(0.0, 10.0))
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.35), BlendMode.multiply),
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              desc,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            publishedTime,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
