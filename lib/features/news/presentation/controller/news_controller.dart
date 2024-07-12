import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../core/data/models/articles_response_model.dart';
import '../../../../core/data/remote/connectivity_service_helper.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/global_functions.dart';
import '../../data/models/article_model.dart';
import '../../domain/news_repository.dart';

class NewsController extends GetxController
    with ConnectivityServiceHelperMixin {
  late NewsRepository newsRepo;
  final scrolController = ScrollController();

  NewsController({
    required this.newsRepo,
  });

  RxInt currentPage = RxInt(1);
  Rx<SortBy> sortBy = Rx<SortBy>(SortBy.publishedAt);
  RxBool hasNetworkConnection = RxBool(true);

  RxList<ArticleModel> articles = RxList<ArticleModel>([]);
  RxList<ArticleModel> cachedArticles = RxList<ArticleModel>([]);

  @override
  void onReady() {
    super.onReady();
    init();
  }

  Future<void> init({
    bool bypassInternetCheck = false,
  }) async {
    final hasNetwork = bypassInternetCheck
        ? hasNetworkConnection.value
        : await isConnectedToInternet();
    hasNetworkConnection.value = hasNetwork;

    if (!hasNetwork) {
      await _getLastCachedNews();
    } else {
      await _fetchLatestNews();
    }

    _initListeners();
  }

  Future<void> _getLastCachedNews() async {
    cachedArticles.clear();
    cachedArticles.addAll(
      await newsRepo.loadCachedArticles(),
    );
  }

  Future<void> _fetchLatestNews() async {
    currentPage.value = 1;

    final List<Future<ArticlesResponseModel>> futures = [
      newsRepo.fetchAll(
        company: FanCompany.microsoft,
        sortBy: sortBy.value,
        page: currentPage.value,
      ),
      newsRepo.fetchAll(
        company: FanCompany.apple,
        sortBy: sortBy.value,
        page: currentPage.value,
      ),
      newsRepo.fetchAll(
        company: FanCompany.google,
        sortBy: sortBy.value,
        page: currentPage.value,
      ),
      newsRepo.fetchAll(
        company: FanCompany.tesla,
        sortBy: sortBy.value,
        page: currentPage.value,
      ),
    ];

    List<ArticleModel> list = [];

    try {
      GlobalFunctions.showLoading();

      for (final futureItem in futures) {
        final result = await futureItem;
        if (result.status == "ok") {
          list.addAll(result.articles);
        }
      }

      GlobalFunctions.hideLoading();

      articles.clear();
      articles.addAll(list);

      if (articles.isNotEmpty) {
        newsRepo.cacheTheArticles(articles.value);
      }
    } catch (er) {
      debugPrint('''
      ===========[ NEWS CONTROLLER EXCEPTION ]===========
      FUNC     > _fetchLatestNews
      MESSAGE > $er
      ===============================================================
      ''');
      GlobalFunctions.hideLoading();
    }
  }

  Future<void> _fetchLatestNewsMore() async {
    /* Utilize for loading more data */
    GlobalFunctions.showLoading();

    final List<Future<ArticlesResponseModel>> futures = [
      newsRepo.fetchAll(
        company: FanCompany.microsoft,
        sortBy: sortBy.value,
        page: currentPage.value + 1,
      ),
      newsRepo.fetchAll(
        company: FanCompany.apple,
        sortBy: sortBy.value,
        page: currentPage.value + 1,
      ),
      newsRepo.fetchAll(
        company: FanCompany.google,
        sortBy: sortBy.value,
        page: currentPage.value + 1,
      ),
      newsRepo.fetchAll(
        company: FanCompany.tesla,
        sortBy: sortBy.value,
        page: currentPage.value + 1,
      ),
    ];

    List<ArticleModel> list = [];

    try {
      GlobalFunctions.showLoading();

      for (final futureItem in futures) {
        final result = await futureItem;
        if (result.status == "ok") {
          list.addAll(result.articles);
        }
      }

      GlobalFunctions.hideLoading();

      articles.addAll(list);
      currentPage.value++;

      if (articles.isNotEmpty) {
        newsRepo.cacheTheArticles(articles.value);
      }
    } catch (er) {
      debugPrint('''
      ===========[ NEWS CONTROLLER EXCEPTION ]===========
      FUNC     > _fetchLatestNewsMore
      MESSAGE > $er
      ===============================================================
      ''');
      GlobalFunctions.hideLoading();
    }
  }

  void _onArticlesListScrolled() {
    if (scrolController.offset >= scrolController.position.maxScrollExtent &&
        !scrolController.position.outOfRange) {
      _fetchLatestNewsMore();
    }
  }

  void _initListeners() {
    internetStatus.listen(
      (internetStatus) {
        hasNetworkConnection.value = internetStatus == InternetStatus.connected;

        if (hasNetworkConnection.value) {
          _fetchLatestNews();
        } else {
          _getLastCachedNews();
        }

        hasNetworkConnection.refresh();
      },
    );
    sortBy.listen((newSortBy) => _fetchLatestNews());
    scrolController.addListener(_onArticlesListScrolled);
  }
}
