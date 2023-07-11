import 'package:flutter_homework/pages/home/home_page.dart';
import 'package:flutter_homework/pages/login/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
    AppRoutes._(); 
    static final routes = [
      GetPage(name: Routes.main, page: () => const LoginPage()),
      GetPage(name: Routes.home, page: () => const HomePage()),
    ];
  }

class Routes {
    Routes._();
    static const String main = '/';
    static const String home = '/home';

  }