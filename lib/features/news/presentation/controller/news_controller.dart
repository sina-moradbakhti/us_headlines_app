import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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
  Rx<FanCompany> company = Rx<FanCompany>(FanCompany.microsoft);
  RxBool hasNetworkConnection = RxBool(true);

  RxList<ArticleModel> articles = RxList<ArticleModel>([]);
  RxList<ArticleModel> cachedArticles = RxList<ArticleModel>([]);

  @override
  void onReady() {
    super.onReady();

    _init();
  }

  void _init() {
    isConnectedToInternet().then((hasNetwork) {
      hasNetworkConnection.value = hasNetwork;

      if (!hasNetwork) {
        _getLastCachedNews();
      } else {
        _fetchLatestNews();
      }

      _initListeners();
    });
  }

  Future<void> _getLastCachedNews() async {
    cachedArticles.clear();
    cachedArticles.addAll(
      await newsRepo.loadCachedArticles(),
    );
  }

  Future<void> _fetchLatestNews() async {
    currentPage.value = 1;
    GlobalFunctions.showLoading();

    newsRepo
        .fetchAll(
      company: company.value,
      sortBy: sortBy.value,
      page: currentPage.value,
    )
        .then((result) {
      if (result.status == "ok") {
        articles.clear();
        articles.addAll(result.articles);
      }
    }).whenComplete(() {
      GlobalFunctions.hideLoading();
      newsRepo.cacheTheArticles(articles.value);
    });
  }

  Future<void> _fetchLatestNewsMore() async {
    /* Utilize for loading more data */
    GlobalFunctions.showLoading();

    newsRepo
        .fetchAll(
      company: company.value,
      sortBy: sortBy.value,
      page: currentPage.value,
    )
        .then((result) {
      if (result.status == "ok") {
        articles.addAll(result.articles);
      }
    }).whenComplete(() {
      GlobalFunctions.hideLoading();
      newsRepo.cacheTheArticles(articles.value);
    });
  }

  void _onArticlesListScrolled() {
    if (scrolController.offset >= scrolController.position.maxScrollExtent &&
        !scrolController.position.outOfRange) {
      currentPage.value++;
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
    company.listen((newComapny) => _fetchLatestNews());
    scrolController.addListener(_onArticlesListScrolled);
  }
}
