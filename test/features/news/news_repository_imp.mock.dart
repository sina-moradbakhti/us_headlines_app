import 'package:flutter_test/flutter_test.dart';
import 'package:nexttoptech_assignment/core/data/models/articles_response_model.dart';
import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/features/news/data/models/article_model.dart';
import 'package:nexttoptech_assignment/features/news/domain/news_repository.dart';

import 'news_data.mock.dart';

class TestNewsRepository implements NewsRepository {
  @override
  Future<List<ArticleModel>> loadCachedArticles() async {
    return NewsDataMock.localArticles;
  }

  @override
  Future<void> cacheTheArticles(List<ArticleModel> articles) async {}

  @override
  Future<ArticlesResponseModel> fetchAll({
    required FanCompany company,
    SortBy sortBy = SortBy.publishedAt,
    int page = 1,
  }) async {
    if (sortBy == SortBy.publishedAt) {
      return NewsDataMock.articlesSuccess;
    } else {
      return NewsDataMock.articlesSortedByPopularitySuccess;
    }
  }
}
