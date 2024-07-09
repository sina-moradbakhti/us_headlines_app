import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_config.dart';
import '../../../../core/data/models/response_model.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/data/remote/remote_service_helper.dart';
import '../../../../core/utils/enums.dart';

class NewsServices extends RemoteServiceHelper {
  Future<Either<FailureResponse, SuccessReponse>> fetchArticles({
    required FanCompany company,
    SortBy sortBy = SortBy.publishedAt,
    int page = 1,
    int pageSize = 20,
  }) async {
    return await request(
      ServiceRequestMethod.get,
      endpoint: 'everything',
      body: {
        'q': company.toStrName(),
        'from': DateTime.now().add(const Duration(days: -1)).toStrDate,
        'to': DateTime.now().toStrDate,
        'sortBy': sortBy.toStrSortBy(),
        'page': page.toString(),
        'pageSize': pageSize.toString(),
        'apiKey': AppConfig.newsApiKey,
      },
    );
  }
}
