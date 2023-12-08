import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:nytarticles/models/article.dart';

ArticleList mostPopularListFromJson(String str) =>
    ArticleList.fromJson(json.decode(str));

String mostPopularListToJson(ArticleList data) => json.encode(data.toJson());

@JsonSerializable()
class ArticleList {
  String? status;
  String? copyright;
  int? numResults;
  List<Article>? articles;

  ArticleList({this.status, this.copyright, this.numResults, this.articles});

  factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        articles: json["results"] == null
            ? []
            : List<Article>.from(
                json["results"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}
