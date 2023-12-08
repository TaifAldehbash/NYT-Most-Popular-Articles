import 'package:flutter/material.dart';

class ArticleBody extends StatelessWidget {
  String? title;
  String? author;
  DateTime? publishedDate;
  String? articlesListAbstract;

  ArticleBody(
      this.title, this.author, this.publishedDate, this.articlesListAbstract,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    publishedDate.toString().substring(0, 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            articlesListAbstract!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
