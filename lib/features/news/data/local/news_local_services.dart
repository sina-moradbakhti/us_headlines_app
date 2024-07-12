import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../../core/constants/app_local_service_keys.dart';
import '../../../../core/data/local/local_service_helper.dart';
import '../models/article_model.dart';

class NewsLocalServices extends LocalServiceHelper {
  Future<void> storeLatestNews(List<ArticleModel> articles) async {
    String latestNewsJson = jsonEncode(
      articles
          .map(
            (e) => e.toJsonObject(),
          )
          .toList(),
    );

    await write(
      AppLocalServiceKeys.latestNews,
      latestNewsJson,
    );
  }

  Future<List<ArticleModel>> loadLatestNews() async {
    final jsonData = await read(
      AppLocalServiceKeys.latestNews,
    );

    try {
      final mapData = jsonDecode(jsonData);

      return [
        for (final item in mapData)
          ArticleModel.fromJsonMap(
            item,
            item['company'],
          ),
      ];
    } catch (er) {
      debugPrint('''
      ===========[ LOCAL SERVICE HELPER CATCH ERROR ]===========
      ERROR > ${er.toString()}
      ===============================================================
      ''');

      return [];
    }
  }
}
