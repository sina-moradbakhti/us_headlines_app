import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/loader_widget.dart';
import '../../../features/splash/presentation/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppStrings.appIsLoading,
              style: Get.textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const LoaderWidget(),
        ],
      ),
    );
  }
}
