import 'package:get/get.dart';

import '../../../../core/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    /* Its a Mock loading for simulating the real app loading latency */
    Future.delayed(const Duration(seconds: 2)).then((_) {
      return Get.offAllNamed(AppRoutes.news);
    });
  }
}
