import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import 'controller/news_controller.dart';
import 'widgets/article_list_widget.dart';

class NewsScreen extends GetWidget<NewsController> {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ObxValue(
          (hasNetwork) => Text(
            hasNetwork.value
                ? AppStrings.usHeadlines
                : '${AppStrings.usHeadlines} (${AppStrings.offline})',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          controller.hasNetworkConnection,
        ),
      ),
      body: const ArticleListWidget(),
    );
  }
}
