import 'package:flutter/material.dart';
import 'package:news_api/Models/news.api.dart';
import 'package:news_api/Models/news_model.dart';
import 'package:news_api/Pages/news_card_widget.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> _newsModel = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    _newsModel = await NewsApi.getNews();
    print(_newsModel.length);
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
              'News',
              style: TextStyle(
                  color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 2.0,
          ),
          body: isLoading
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
                  }))),
    );
  }
}
