// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleImage extends StatelessWidget {
  String imageUrl;
  BoxFit boxFit;
  double height, width;
  BoxShape boxShape;
  ArticleImage(
      this.imageUrl, this.boxFit, this.height, this.width, this.boxShape,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: boxShape,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        height: height > 0 ? height : null,
        width: width > 0 ? width : null,
        progressIndicatorBuilder: (context, url, progress) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircularProgressIndicator(
              value: progress.progress,
              color: Color.fromARGB(200, 120, 225, 195),
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(
          Icons.error,
        ),
      ),
    );
  }
}
