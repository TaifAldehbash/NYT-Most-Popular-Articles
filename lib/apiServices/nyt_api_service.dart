import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nytarticles/models/article_list.dart';

class NYTAPIService with ChangeNotifier {
  ArticleList mostPopularArticles = ArticleList();
  static const apiKey = String.fromEnvironment('API_KEY');
  static const baseUrl = "https://api.nytimes.com/svc";

  Future<ArticleList?> getMostPopularArticles(int day, String section) async {
    final endPoint =
        '$baseUrl/mostpopular/v2/mostviewed/$section/$day.json?api-key=$apiKey';

    var dio = Dio();
    try {
      var response = await dio.get(
        endPoint,
      );
      if (response.statusCode == 200) {
        print(response.data);
        var json = response.data;
        mostPopularArticles = ArticleList.fromJson(json);
      }

      notifyListeners();
      return mostPopularArticles;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return mostPopularArticles;
    }
  }
}
