import 'package:get/get.dart';

import '../../Features/splash/presentation/binding/splash_binding.dart';
import '../../Features/splash/presentation/splash_screen.dart';
import '../../features/news/presentation/binding/news_binding.dart';
import '../../features/news/presentation/news_screen.dart';
import '../../features/news_details/presentation/binding/news_details_binding.dart';
import '../../features/news_details/presentation/news_details_screen.dart';

class AppRoutes {
  static String get splash => '/splash';
  static String get news => '/news';
  static String get newsDetails => '/news-details';

  static List<GetPage> get pages => [
        GetPage(
          name: splash,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: news,
          page: () => const NewsScreen(),
          binding: NewsBinding(),
        ),
        GetPage(
          name: newsDetails,
          page: () => const NewsDetailsScreen(),
          binding: NewsDetailsBinding(),
        ),
      ];
}
