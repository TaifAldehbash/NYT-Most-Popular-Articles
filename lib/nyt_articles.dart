// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nytarticles/apiServices/nyt_api_service.dart';
import 'package:nytarticles/locator.dart';
import 'package:nytarticles/models/article_list.dart';
import 'package:nytarticles/widgets/nyt_article_list.dart';

class NYTArticles extends StatefulWidget {
  const NYTArticles({super.key});

  @override
  State<NYTArticles> createState() => _NYTArticlesPageState();
}

class _NYTArticlesPageState extends State<NYTArticles> {
  String pageTitle = "NY Times Most Popular";
  ArticleList mostPopularArticles = ArticleList();

  @override
  initState() {
    getMostPopularArticles();
    super.initState();
  }

  Future<void> getMostPopularArticles() async {
    ArticleList articles = (await locator
            .get<NYTAPIService>()
            .getMostPopularArticles(7, "all-sections")) ??
        ArticleList();
    setState(() {
      mostPopularArticles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 120, 225, 195),
        title: Text(pageTitle),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          tooltip: 'Menu',
          onPressed: () {
            // handle the press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            tooltip: 'Search articles',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            tooltip: 'Sort articles',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (mostPopularArticles.status != null)
              Expanded(
                child: NyArticlesList(
                  articles: mostPopularArticles.articles,
                ),
              )
            else
              const CircularProgressIndicator(
                color: Colors.greenAccent,
                semanticsLabel: 'Circular progress indicator',
              ),
          ],
        ),
      ),
    );
  }
}
