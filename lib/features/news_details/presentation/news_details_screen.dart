import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexttoptech_assignment/core/constants/app_sizes.dart';
import 'package:nexttoptech_assignment/core/theme/app_colors.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'controller/news_details_controller.dart';

class NewsDetailsScreen extends GetWidget<NewsDetailsController> {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            size: AppSizes.backButtonIconSize,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: controller.article.urlToImage ?? '',
              errorWidget: (context, url, error) => Container(
                color: AppColors.primaryColor.withOpacity(0.2),
              ),
              width: Get.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.article.title ?? '[No Title]',
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.article.description ?? '',
                    style: Get.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                  if (controller.article.author != null &&
                      controller.article.publishedAt != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Author: ${controller.article.author}',
                            style: Get.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          if (controller.article.publishedAt != null)
                            Text(
                              'Date: ${controller.article.publishedAt!.toStrDate}',
                              style: Get.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  Divider(
                    thickness: 0.1,
                    height: 40,
                    color: AppColors.lightGreyColor.withOpacity(0.9),
                  ),
                  Text(
                    controller.article.content ?? '',
                    style: Get.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                    thickness: 0.1,
                    height: 40,
                    color: AppColors.lightGreyColor.withOpacity(0.9),
                  ),
                  TextButton(
                    onPressed: () {
                      launchUrlString(controller.article.url ?? '');
                    },
                    child: Text(
                      'Link: ${controller.article.source.name}',
                      style: Get.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondaryColor,
                        fontSize: 11,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
