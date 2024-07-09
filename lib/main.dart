import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:get/get.dart';

import 'core/constants/app_config.dart';
import 'core/constants/app_routes.dart';
import 'core/data/local/local_service_helper.dart';
import 'core/theme/app_themes.dart';
import 'core/widgets/loader_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalServiceHelper().initializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: AppConfig.appName,
        theme: DefaultAppTheme.theme,
        themeMode: ThemeMode.light,
        textDirection: TextDirection.ltr,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.splash,
        builder: (context, child) => LoaderOverlay(
          useDefaultLoading: false,
          overlayWidgetBuilder: (_) => PopScope(
            canPop: false,
            onPopInvoked: (didPop) => true,
            child: Container(
              alignment: Alignment.center,
              child: const Center(
                child: LoaderWidget(),
              ),
            ),
          ),
          child: child ?? Container(),
        ),
      ),
    );
  }
}
