import 'package:get/get.dart';

import '../../data/local/news_local_services.dart';
import '../../data/remote/news_services.dart';
import '../../data/repository/news_repository_impl.dart';
import '../controller/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(
        newsRepo: NewsRepositoryImpl(
          services: NewsServices(),
          localServices: NewsLocalServices(),
        ),
      ),
    );
  }
}
