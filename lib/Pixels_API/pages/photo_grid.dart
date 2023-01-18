import 'package:flutter/material.dart';
import 'package:news_api/Pixels_API/pages/hero.dart';

class PhotoGrid extends StatelessWidget {
  final String imgUrl;
  final String photographer;
  const PhotoGrid(
      {super.key, required this.imgUrl, required this.photographer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return HeroView(url: imgUrl);
          })));
        },
        child: Container(
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    photographer,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
