import 'package:http/http.dart' as http;

class SuccessReponse {
  final http.Response response;

  SuccessReponse({
    required this.response,
  });
}

class FailureResponse {
  final String message;

  FailureResponse({
    required this.message,
  });
}
