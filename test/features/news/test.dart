import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/features/news/presentation/controller/news_controller.dart';

import 'news_repository_imp.mock.dart';

void main() {
  late NewsController newsController;
  late TestNewsRepository testNewsRepository;

  setUp(() {
    testNewsRepository = TestNewsRepository();
    newsController = NewsController(
      newsRepo: testNewsRepository,
    );

    Get.put(newsController);
  });

  group('NewsController Tests', () {
    test('Initial values are correct', () {
      expect(newsController.currentPage.value, 1);
      expect(newsController.sortBy.value, SortBy.publishedAt);
      expect(newsController.company.value, FanCompany.microsoft);
      expect(newsController.hasNetworkConnection.value, true);
      expect(newsController.articles, isEmpty);
      expect(newsController.cachedArticles, isEmpty);
    });

    test('Fetches latest news on init with network connection', () async {
      await newsController.init();

      expect(newsController.articles.length, 3);
      expect(newsController.articles[0].title, "article 1");
    });

    test('Loads cached news on init without network connection', () async {
      newsController.hasNetworkConnection.value = false;
      await newsController.init(bypassInternetCheck: true);

      expect(newsController.cachedArticles.length, 3);
      expect(newsController.cachedArticles[0].title, "article from cache 1");
      expect(newsController.articles.length, 0);
    });

    test('Fetch new data after chnaging SortBy', () async {
      bool sortByListenerTriggered = false;

      ever(newsController.sortBy, (SortBy sortBy) {
        sortByListenerTriggered = true;
      });

      newsController.sortBy.value = SortBy.popularity;

      await Future.delayed(const Duration(seconds: 1));

      expect(sortByListenerTriggered, isTrue);
    });

    test('Fetch new data after chnaging Company', () async {
      bool fanCompanyListenerTriggered = false;

      ever(newsController.company, (FanCompany company) {
        fanCompanyListenerTriggered = true;
      });

      newsController.company.value = FanCompany.tesla;

      await Future.delayed(const Duration(seconds: 1));

      expect(fanCompanyListenerTriggered, isTrue);
    });
  });
}
