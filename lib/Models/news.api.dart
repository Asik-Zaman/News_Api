import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/Models/news_model.dart';

class NewsApi {
  static Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=use your own key'));

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['articles']) {
      if (i['urlToImage'] != null && i['description'] != null) {
        _temp.add(i);
      }
    }
    return NewsModel.newsList(_temp);
  }
}
