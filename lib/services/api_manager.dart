import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/constants/string.dart';
import 'package:newsapp/models/newsModel.dart';

final _client = http.Client();

class Api_Manager {
  Future<NewsModel> getNews() async {
    var newsModel = null;

    try {
      var response = await _client.get(Uri.parse(Strings.news_url_1));
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

  Future<NewsModel> getIndiaNews() async {
    var newsModel = null;

    try {
      var response = await http.get(Uri.parse(Strings.news_url_1));
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
