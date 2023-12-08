// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:nytarticles/article_page.dart';
import 'package:nytarticles/models/article.dart';
import 'package:nytarticles/widgets/article_image.dart';

class NyArticlesListItem extends StatelessWidget {
  Article? article;
  NyArticlesListItem({this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {
            Navigator.pushNamed(context, ArticlePage.routeKey,
                arguments: article);
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "${article!.title}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${article!.byline}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${article!.source}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${article!.publishedDate}".substring(0, 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          leading: ArticleImage(
              "${article!.media!.isNotEmpty ? article!.media![0].mediaMetadata![0].url : "https://icon-library.com/images/google-photos-icon/google-photos-icon-8.jpg"}",
              BoxFit.cover,
              50,
              50,
              BoxShape.circle),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
