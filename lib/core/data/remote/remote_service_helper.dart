import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nexttoptech_assignment/core/data/models/response_model.dart';
import 'package:nexttoptech_assignment/core/utils/extensions.dart';

import '../../constants/app_config.dart';
import '../../utils/enums.dart';

class RemoteServiceHelper {
  Uri urlMaker(
    String endPoint, {
    Map<String, String> queries = const {},
  }) {
    String q = "";

    queries.forEach((key, value) {
      if (q == "") {
        q = "$key=$value";
      } else {
        q = "$q&$key=$value";
      }
    });

    return Uri.parse(
      q.isNotEmpty
          ? "${AppConfig.newsApiUrl}/$endPoint?$q"
          : "${AppConfig.newsApiUrl}/$endPoint",
    );
  }

  Future<Either<FailureResponse, SuccessReponse>> request(
    ServiceRequestMethod method, {
    required String endpoint,
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    final client = http.Client();

    http.Response? response;

    try {
      switch (method) {
        case ServiceRequestMethod.get:
          response = await client.get(
            urlMaker(
              endpoint,
              queries: body ?? {},
            ),
            headers: headers,
          );
          break;

        case ServiceRequestMethod.post:
          response = await client.post(
            urlMaker(
              endpoint,
              queries: body ?? {},
            ),
            headers: headers,
          );
          break;
      }

      if (response.statusCode != 200) {
        return Left(
          FailureResponse(
            message: response.body.clearText,
          ),
        );
      }

      return Right(
        SuccessReponse(
          response: response,
        ),
      );
    } on http.ClientException catch (exception) {
      debugPrint('''
      ===========[ SERVICE HELPER CATCH CLIENT EXCEPTION ]===========
      URL     > ${exception.uri}
      MESSAGE > ${exception.message}
      ===============================================================
      ''');

      return Left(
        FailureResponse(
          message: exception.message,
        ),
      );
    } catch (error) {
      debugPrint('''
      ===========[ SERVICE HELPER CATCH ERROR ]===========
      ERROR > ${error.toString()}
      ====================================================
      ''');

      return Left(
        FailureResponse(
          message: error.toString(),
        ),
      );
    }
  }
}
