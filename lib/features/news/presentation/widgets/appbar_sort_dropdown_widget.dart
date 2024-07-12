import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexttoptech_assignment/core/constants/app_strings.dart';
import 'package:nexttoptech_assignment/core/utils/enums.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';
import 'package:nexttoptech_assignment/features/news/presentation/controller/news_controller.dart';

import '../../../../core/theme/app_colors.dart';

class AppbarSortByDropdownWidget extends GetView<NewsController> {
  final bool enable;

  const AppbarSortByDropdownWidget({
    super.key,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (selectedSortBy) => Row(
        children: [
          Text(
            '${AppStrings.sortBy}:  ',
            style: Get.textTheme.labelSmall?.copyWith(
              color: AppColors.lightGreyColor,
            ),
          ),
          DropdownButton(
            underline: Container(),
            hint: Text(
              selectedSortBy.value.toStrSortBy(),
              style: Get.textTheme.labelSmall,
            ),
            items: [
              DropdownMenuItem(
                key: Key(SortBy.publishedAt.toString()),
                value: SortBy.publishedAt,
                child: Text(
                  SortBy.publishedAt.toStrSortBy(),
                  style: Get.textTheme.labelSmall,
                ),
              ),
              DropdownMenuItem(
                key: Key(SortBy.popularity.toString()),
                value: SortBy.popularity,
                child: Text(
                  SortBy.popularity.toStrSortBy(),
                  style: Get.textTheme.labelSmall,
                ),
              ),
            ],
            onChanged: (item) {
              if (enable) {
                controller.sortBy.value = item ?? SortBy.publishedAt;
              }
            },
          ),
        ],
      ),
      controller.sortBy,
    );
  }
}
