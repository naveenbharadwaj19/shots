import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shots/domains/apis/news_api.dart';

class NewsProvider extends ChangeNotifier {
  final NewsApiService apiService = NewsApiService.create();
  bool isLoading = false;
  List<Map<String, dynamic>> articles = [];

  void updateIsLoading(bool v) {
    isLoading = v;
    notifyListeners();
  }

  Future<void> fetchTechNews() async {
    updateIsLoading(true);
    String currentDate = DateFormat("yyyy-mm-dd").format(DateTime.now());
    var res = await apiService.fetchNews(currentDate, currentDate,
        apiKey: dotenv.env["API_KEY"] as String);
    if (res.isSuccessful) {
      var resDecode = json.decode(res.bodyString);
      articles = (resDecode['articles'] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      updateIsLoading(false);
    } else {
      print(res.statusCode);
      print(res.body);
    }
  }
}
