import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/constants/string.dart';
import 'package:newsapp/models/newsModel.dart';

class Api_Manager {
  Future<NewsModel> getNews() async {
    final _client = http.Client();
    var newsModel = null;

    try {
      var response = await http.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var response_string = response.body;
        var jsonMap = jsonDecode(response_string);

        newsModel = NewsModel.fromJson(jsonMap);
      } else {
        newsModel = null;
      }
    } catch (e) {
      print(e);
    }
    return newsModel;
  }
}
