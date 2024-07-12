import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';

import '../../../../core/data/models/source_model.dart';

class ArticleModel {
  final SourceModel source;
  final FanCompany company;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  ArticleModel({
    required this.source,
    required this.company,
    this.title,
    this.description,
    this.url,
    this.content,
    this.author,
    this.publishedAt,
    this.urlToImage,
  });

  factory ArticleModel.fromJsonMap(
    Map<String, dynamic> jsonMap,
    String company,
  ) =>
      ArticleModel(
        source: SourceModel.fromJsonMap(
          jsonMap['source'],
        ),
        company: company.toFanCompany(),
        author: jsonMap['author'],
        content: jsonMap['content'],
        description: jsonMap['description'],
        publishedAt: DateTime.tryParse(
          jsonMap['publishedAt'],
        ),
        title: jsonMap['title'],
        url: jsonMap['url'],
        urlToImage: jsonMap['urlToImage'],
      );

  Map<String, dynamic> toJsonObject() {
    return {
      'source': source.toJsonObject(),
      'company': company.toStrName(),
      'author': author,
      'content': content,
      'description': description,
      'publishedAt': publishedAt.toString(),
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
    };
  }
}
