import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';

import '../../../features/news/data/models/article_model.dart';

class ArticlesResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  ArticlesResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResponseModel.fromJsonMap(
    Map<String, dynamic> jsonMap,
    FanCompany company,
  ) =>
      ArticlesResponseModel(
        status: jsonMap['status'],
        totalResults: jsonMap['totalResults'] ?? 0,
        articles: (jsonMap['articles'] != null && jsonMap['articles'] is List)
            ? [
                for (final item in jsonMap['articles'])
                  ArticleModel.fromJsonMap(
                    item,
                    company.toStrName(),
                  ),
              ]
            : [],
      );
}
