import '../../../core/data/models/articles_response_model.dart';
import '../../../core/utils/enums.dart';
import '../data/models/article_model.dart';

abstract class NewsRepository {
  Future<ArticlesResponseModel> fetchAll({
    required FanCompany company,
    SortBy sortBy = SortBy.publishedAt,
    int page = 1,
  });

  Future<void> cacheTheArticles(List<ArticleModel> articles);
  Future<List<ArticleModel>> loadCachedArticles();
}
