import '../../../features/news/data/models/article_model.dart';

class ArticleResponseModel {
  final String status;
  final int totalResults;
  final ArticleModel article;

  ArticleResponseModel({
    required this.status,
    required this.totalResults,
    required this.article,
  });

  factory ArticleResponseModel.fromJsonMap(
    Map<String, dynamic> jsonMap,
  ) =>
      ArticleResponseModel(
        status: jsonMap['status'],
        totalResults: jsonMap['totalResults'] ?? 0,
        article: jsonMap['article'],
      );
}
