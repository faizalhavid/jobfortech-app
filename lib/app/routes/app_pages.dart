import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jobfortech/app/modules/Auth/views/register_view.dart';
import 'package:jobfortech/app/modules/Dashboard/views/navigation.dart';

import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/login_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Profile/bindings/menu_binding.dart';
import '../modules/Profile/views/menu_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static String get INITIAL => initialRouteMiddleware();

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
      ];

  static String initialRouteMiddleware() {
    User? user = _auth.currentUser;
    if (user != null && user.emailVerified) {
      return Routes.DASHBOARD;
    } else {
      return Routes.AUTH;
    }
  }
}
