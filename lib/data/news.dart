import 'dart:convert';

import 'package:coronatracker/constant.dart';
import 'package:coronatracker/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsResponse {
  Future<List<News>> fetchNews() async {
    try {
      final response = await http.get(
          Uri.parse("https://corona.askbhunte.com/api/v1/news"),
          headers: {"Accept": "application/json"});
      List data = jsonDecode(response.body)["data"];
      List<News> results = data.map((e) => News.fromJson(e)).toList();
      return results;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<News>> fetchNewsById(String id) async {
    try {
      final response = await http.get(Uri.parse(Constants.baseUrl + "news/$id"),
          headers: {"Accept": "application/json"});
      List data = jsonDecode(response.body);
      List<News> results = data.map((e) => News.fromJson(e)).toList();
      print(results);
      return results;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
