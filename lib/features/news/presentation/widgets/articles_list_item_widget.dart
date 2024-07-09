import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexttoptech_assignment/core/constants/app_routes.dart';
import 'package:nexttoptech_assignment/core/theme/app_colors.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';

import '../../data/models/article_model.dart';

class ArticleListItemWidget extends StatelessWidget {
  final ArticleModel article;

  const ArticleListItemWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      shadowColor: AppColors.lightGreyColor.withOpacity(
        0.3,
      ),
      margin: const EdgeInsets.only(
        bottom: 25,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            AppRoutes.newsDetails,
            arguments: article,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      article.urlToImage ?? '',
                    ),
                    onBackgroundImageError: (exception, stackTrace) =>
                        Container(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              article.source.name,
                              style: Get.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryColor,
                                fontSize: 9,
                              ),
                            ),
                            Text(
                              article.publishedAt != null
                                  ? article.publishedAt!.toStrDate
                                  : '',
                              style: Get.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.lightGreyColor,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.lightGreyColor,
                height: 25,
                thickness: 0.1,
              ),
              if (article.content != null)
                Text(
                  article.content!.clearText,
                  style: Get.textTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Author: ${article.author}',
                style: Get.textTheme.labelSmall?.copyWith(
                  color: AppColors.lightGreyColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
