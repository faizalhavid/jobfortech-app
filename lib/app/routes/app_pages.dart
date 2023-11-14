import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../modules/Article/bindings/article_binding.dart';
import '../modules/Article/views/article_list.dart';
import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/login_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/navigation.dart';
import '../modules/Profile/bindings/menu_binding.dart';
import '../modules/Profile/views/menu_view.dart';
import '../modules/Work/bindings/work_binding.dart';
import '../modules/Work/views/work_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static Future<String> get INITIAL => initialRouteMiddleware();

  static List<GetPage> get routes => [
        GetPage(
          name: _Paths.AUTH,
          page: () => const LoginView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => const NavigationView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.MENU,
          page: () => const MenuView(),
          binding: MenuBinding(),
        ),
        GetPage(
          name: _Paths.WORK,
          page: () => const WorkView(),
          binding: WorkBinding(),
        ),
        GetPage(
          name: _Paths.ARTICLE,
          page: () => const ArticleListView(),
          binding: ArticleBinding(),
        ),
      ];

  static Future<String> initialRouteMiddleware() async {
    final secureStorage = FlutterSecureStorage();

    final token = await secureStorage.read(key: 'token');
    print('token : ${token}');
    if (token == null || token == '') {
      return _Paths.AUTH;
    } else {
      return _Paths.DASHBOARD;
    }
  }
}
