import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GlobalFunctions {
  static void showLoading() {
    if (!Get.context!.loaderOverlay.visible) {
      Get.context?.loaderOverlay.show();
    }
  }

  static void hideLoading() async {
    if (Get.context!.loaderOverlay.visible) {
      Get.context?.loaderOverlay.hide();
    }
  }

  static showErrorMessage(String message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        'Error',
        style: Get.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message.trim(),
        style: Get.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(
        seconds: 4,
      ),
    );
  }
}
