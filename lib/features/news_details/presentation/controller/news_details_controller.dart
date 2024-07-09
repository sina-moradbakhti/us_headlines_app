import 'package:get/get.dart';
import 'package:nexttoptech_assignment/features/news/data/models/article_model.dart';

class NewsDetailsController extends GetxController {
  late ArticleModel article;

  @override
  void onInit() {
    super.onInit();
    article = Get.arguments;
  }
}
