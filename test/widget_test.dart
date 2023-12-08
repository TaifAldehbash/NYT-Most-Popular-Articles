// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nytarticles/models/article.dart';
import 'package:nytarticles/models/media.dart';
import 'package:nytarticles/models/media_metadata.dart';
import 'package:nytarticles/widgets/nyt_article_list.dart';
import 'package:nytarticles/widgets/nyt_article_list_item.dart';

void main() {
  List<Article> mostPopularArticles = <Article>[
    Article(
        uri: "nyt://article/4f0edde0-6a1e-5b45-96c7-822088080282",
        url:
            "https://www.nytimes.com/2023/11/19/us/politics/rosalynn-carter-dead.html",
        id: 100000006678089,
        assetId: 100000006678089,
        source: "New York Times",
        publishedDate: DateTime.parse("2023-11-19"),
        updated: DateTime.parse("2023-12-05 08:57:16"),
        section: "U.S.",
        subsection: "Politics",
        nytdsection: "u.s.",
        adxKeywords:
            "Deaths (Obituaries);Presidential Election of 1980;Women's Rights;Mental Health and Disorders;First Ladies (US);United States Politics and Government;Carter, Rosalynn;Carter, Jimmy;Georgia",
        column: null,
        byline: "By Katharine Q. Seelye",
        type: "Article",
        title:
            "Rosalynn Carter, First Lady and a Political Partner, Dies at 96",
        articlesListAbstract:
            "She helped propel Jimmy Carter from rural Georgia to the White House and became the most politically active first lady since Eleanor Roosevelt.",
        desFacet: [
          "Deaths (Obituaries)",
          "Presidential Election of 1980",
          "Women's Rights",
          "Mental Health and Disorders",
          "First Ladies (US)",
          "United States Politics and Government"
        ],
        orgFacet: [],
        perFacet: ["Carter, Rosalynn", "Carter, Jimmy"],
        geoFacet: ["Georgia"],
        media: <Media>[
          Media(
              caption:
                  "The Carters in 1979. Mr. Carter called her “an almost equal extension of myself.”",
              approvedForSyndication: 1,
              copyright: "Corbis, via Getty Images",
              subtype: "photo",
              type: "image",
              mediaMetadata: <MediaMetadata>[
                MediaMetadata(
                    format: "Standard Thumbnail",
                    url:
                        "https://static01.nyt.com/images/2020/01/21/obituaries/00Carter-Rosalynn1-sub-copy-slide/00Carter-Rosalynn1-sub-copy-slide-thumbStandard.jpg",
                    height: 75,
                    width: 75)
              ]),
        ],
        etaId: 0)
  ];
  testWidgets('NyArticlesListItem widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        MaterialApp(home: NyArticlesListItem(article: mostPopularArticles[0])));

    expect(find.text(mostPopularArticles[0].title!), findsWidgets);
  });

  testWidgets('NyArticlesList widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        MaterialApp(home: NyArticlesList(articles: mostPopularArticles)));

    expect(find.text(mostPopularArticles[0].title!), findsWidgets);
  });
}
