import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api/Pixels_API/Model/models.dart';
import 'package:news_api/Pixels_API/Model/photo.api.dart';
import 'package:news_api/Pixels_API/pages/photo_grid.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List<PhotoModel> _photos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    _photos.clear();
    _photos = await PhotoApi.getPhoto();
    print(_photos.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Wallpaper',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 2.0,
          ),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: .6,
                  ),
                  itemCount: _photos.length,
                  itemBuilder: ((context, index) {
                    return PhotoGrid(
                      imgUrl: _photos[index].imgUrl,
                      photographer: _photos[index].photographer,
                    );
                  }))

          /* body: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _newsModel.length,
                  itemBuilder: ((context, index) {
                    DateTime now =
                        DateTime.parse(_newsModel[index].publishedTime);
                    String time =
                        DateFormat('E, d MMM yyyy HH:mm:ss').format(now);
                    return NewsCard(
                        title: _newsModel[index].title,
                        desc: _newsModel[index].desc,
                        imgUrl: _newsModel[index].imgUrl,
                        linkUrl: _newsModel[index].linkUrl,
                        publishedTime: time);
                  })) */
          ),
    );
  }
}
