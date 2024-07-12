import 'package:nexttoptech_assignment/core/data/models/articles_response_model.dart';
import 'package:nexttoptech_assignment/core/data/models/source_model.dart';
import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/features/news/data/models/article_model.dart';

class NewsDataMock {
  static final articlesSuccess = ArticlesResponseModel(
    totalResults: 3,
    status: "ok",
    articles: [
      ArticleModel(
        title: "article 1",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.microsoft,
      ),
      ArticleModel(
        title: "article 2",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.apple,
      ),
      ArticleModel(
        title: "article 3",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.google,
      ),
      ArticleModel(
        title: "article 4",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.tesla,
      ),
    ],
  );

  static final articlesSortedByPopularitySuccess = ArticlesResponseModel(
    totalResults: 3,
    status: "ok",
    articles: [
      ArticleModel(
        title: "article 4",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.microsoft,
      ),
      ArticleModel(
        title: "article 3",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.apple,
      ),
      ArticleModel(
        title: "article 2",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.google,
      ),
      ArticleModel(
        title: "article 1",
        source: SourceModel(
          id: '0',
          name: 'source_name',
        ),
        company: FanCompany.tesla,
      ),
    ],
  );

  static final articlesFailure = ArticlesResponseModel(
    totalResults: 0,
    status: "server error",
    articles: [],
  );

  static final localArticles = [
    ArticleModel(
      title: "article from cache 1",
      source: SourceModel(
        id: '0',
        name: 'source_name',
      ),
      company: FanCompany.microsoft,
    ),
    ArticleModel(
      title: "article from cache 2",
      source: SourceModel(
        id: '0',
        name: 'source_name',
      ),
      company: FanCompany.apple,
    ),
    ArticleModel(
      title: "article from cache 3",
      source: SourceModel(
        id: '0',
        name: 'source_name',
      ),
      company: FanCompany.google,
    ),
    ArticleModel(
      title: "article from cache 4",
      source: SourceModel(
        id: '0',
        name: 'source_name',
      ),
      company: FanCompany.tesla,
    ),
  ];
}
