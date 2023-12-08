import 'package:nytarticles/models/media_metadata.dart';

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: json["media-metadata"] == null
            ? []
            : List<MediaMetadata>.from(
                json["media-metadata"]!.map((x) => MediaMetadata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata": mediaMetadata == null
            ? []
            : List<dynamic>.from(mediaMetadata!.map((x) => x.toJson())),
      };
}
