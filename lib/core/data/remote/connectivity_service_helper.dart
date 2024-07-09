import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/foundation.dart';

mixin ConnectivityServiceHelperMixin {
  final connection = InternetConnection();
  Stream<InternetStatus> get internetStatus => connection.onStatusChange;

  Future<bool> isConnectedToInternet() async {
    if (await connection.hasInternetAccess) {
      debugPrint('''
      ===========[ CONNECTIVITY SERVICE HELPER ]===========
      STATUS > CONNECTED
      ===============================================================
      ''');

      return true;
    } else {
      debugPrint('''
      ===========[ CONNECTIVITY SERVICE HELPER ]===========
      STATUS > NOT CONNECTED
      ===============================================================
      ''');

      return false;
    }
  }
}
