import 'dart:convert';

import 'package:nexttoptech_assignment/features/news/data/local/news_local_services.dart';
import 'package:nexttoptech_assignment/features/news/data/models/article_model.dart';

import '../../../../core/constants/app_config.dart';
import '../../../../core/data/models/articles_response_model.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/global_functions.dart';
import '../../domain/news_repository.dart';
import '../remote/news_services.dart';

class NewsRepositoryImpl implements NewsRepository {
  late NewsServices services;
  late NewsLocalServices localServices;

  NewsRepositoryImpl({
    required this.services,
    required this.localServices,
  });

  @override
  Future<ArticlesResponseModel> fetchAll({
    required FanCompany company,
    SortBy sortBy = SortBy.publishedAt,
    int page = 1,
  }) async {
    final result = await services.fetchArticles(
      company: company,
      sortBy: sortBy,
      page: page,
      pageSize: AppConfig.eachPageResultLenght,
    );

    return result.fold((failure) {
      GlobalFunctions.showErrorMessage(
        failure.message.trim(),
      );

      return ArticlesResponseModel(
        status: "failed",
        articles: [],
        totalResults: 0,
      );
    }, (success) {
      return ArticlesResponseModel.fromJsonMap(
        jsonDecode(
          success.response.body,
        ),
      );
    });
  }

  @override
  Future<void> cacheTheArticles(List<ArticleModel> articles) async {
    await localServices.storeLatestNews(articles);
  }

  @override
  Future<List<ArticleModel>> loadCachedArticles() async =>
      await localServices.loadLatestNews();
}
