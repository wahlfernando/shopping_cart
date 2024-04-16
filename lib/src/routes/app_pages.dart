import 'package:get/get.dart';
import 'package:test_shooping/src/feature/shooping_card/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(name: Routes.home, page: () => const HomePage(), binding: SplashBinding()),
  ];
}
