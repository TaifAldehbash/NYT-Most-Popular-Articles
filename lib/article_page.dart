// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nytarticles/models/article.dart';
import 'package:nytarticles/widgets/article_body.dart';
import 'package:nytarticles/widgets/article_image.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage(this.article, {Key? key}) : super(key: key);
  final Article article;
  static const String routeKey = '/ArticleDetail';

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 120, 225, 195),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          tooltip: 'Previous',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          ArticleImage(
              "${widget.article.media!.isNotEmpty ? widget.article.media![0].mediaMetadata![2].url : "https://icon-library.com/images/google-photos-icon/google-photos-icon-8.jpg"}",
              BoxFit.contain,
              0,
              0,
              BoxShape.rectangle),
          ArticleBody(
              widget.article.title,
              widget.article.byline,
              widget.article.publishedDate,
              widget.article.articlesListAbstract),
        ],
      ),
    );
  }
}
