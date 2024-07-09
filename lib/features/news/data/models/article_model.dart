import '../../../../core/data/models/source_model.dart';

class ArticleModel {
  final SourceModel source;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  ArticleModel({
    required this.source,
    required this.title,
    this.description,
    this.url,
    this.content,
    this.author,
    this.publishedAt,
    this.urlToImage,
  });

  factory ArticleModel.fromJsonMap(Map<String, dynamic> jsonMap) =>
      ArticleModel(
        source: SourceModel.fromJsonMap(
          jsonMap['source'],
        ),
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
