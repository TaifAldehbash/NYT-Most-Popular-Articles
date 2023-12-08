// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nytarticles/article_page.dart';
import 'package:nytarticles/models/article.dart';
import 'package:nytarticles/nyt_articles.dart';
import 'locator.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NYT Articles",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        ArticlePage.routeKey: (BuildContext context) =>
            ArticlePage(ModalRoute.of(context)!.settings.arguments! as Article),
      },
      home: NYTArticles(),
    );
  }
}
