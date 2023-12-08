import 'package:flutter/cupertino.dart';
import 'package:nytarticles/models/article.dart';
import 'package:nytarticles/widgets/nyt_article_list_item.dart';

class NyArticlesList extends StatefulWidget {
  List<Article>? articles;
  NyArticlesList({this.articles, super.key});

  @override
  State<NyArticlesList> createState() => _NyArticlesListState();
}

class _NyArticlesListState extends State<NyArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return NyArticlesListItem(
          article: widget.articles![index],
        );
      },
    );
  }
}
