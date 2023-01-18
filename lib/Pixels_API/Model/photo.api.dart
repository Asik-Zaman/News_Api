import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/Pixels_API/Model/models.dart';

class PhotoApi {
  static Future<List<PhotoModel>> getPhoto() async {
    final response = await http.get(
        Uri.parse(
          'https://api.pexels.com/v1/curated/',
        ),
        headers: {"Authorization": "use your own"});
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['photos']) {
      _temp.add(i);
    }
    print(_temp);

    return PhotoModel.newsList(_temp);
  }
}
