import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shots/domains/apis/news_api.dart';

class NewsController extends GetxController {
  final NewsApiService _apiService = NewsApiService.create();
  bool isLoading = false;
  List<Map<String, dynamic>> articles = [];

  void updateIsLoading(bool v) {
    isLoading = v;
    update();
  }

  Future<void> fetchTechNews() async {
    updateIsLoading(true);
    String currentDate = DateFormat("yyyy-mm-dd").format(DateTime.now());
    var res = await _apiService.fetchNews(currentDate, currentDate,
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

  void refreshTechNews(){
    articles.clear();
    fetchTechNews();
  }

  @override
  void onInit() async {
    await fetchTechNews();
    super.onInit();
  }

  @override
  void onClose() {
    _apiService.client.dispose();
    print("Disposed");
    super.onClose();
  }
}
