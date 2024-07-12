import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexttoptech_assignment/core/constants/app_strings.dart';

import '../controller/news_controller.dart';
import 'appbar_company_dropdown_widget.dart';
import 'appbar_sort_dropdown_widget.dart';
import 'articles_list_item_widget.dart';

class ArticleListWidget extends GetView<NewsController> {
  const ArticleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ObxValue(
              (hasNetwork) => Column(
                children: [
                  Opacity(
                    opacity: hasNetwork.value ? 1 : 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // AppbarCompanyDropdownWidget(
                        //   enable: hasNetwork.value,
                        // ),
                        AppbarSortByDropdownWidget(
                          enable: hasNetwork.value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              controller.hasNetworkConnection,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => controller.hasNetworkConnection.value
                ? _remoteData
                : _localData,
          ),
        ),
      ],
    );
  }

  Widget get _remoteData => controller.articles.isNotEmpty
      ? ListView.builder(
          controller: controller.scrolController,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          itemCount: controller.articles.length,
          itemBuilder: (context, index) => ArticleListItemWidget(
            article: controller.articles.value[index],
          ),
        )
      : Center(
          child: Text(
            AppStrings.nothingToShow,
            style: Get.textTheme.labelSmall,
          ),
        );

  Widget get _localData => controller.cachedArticles.isNotEmpty
      ? ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          itemCount: controller.cachedArticles.length,
          itemBuilder: (context, index) => ArticleListItemWidget(
            article: controller.cachedArticles.value[index],
          ),
        )
      : Center(
          child: Text(
            AppStrings.nothingToShow,
            style: Get.textTheme.labelSmall,
          ),
        );
}
