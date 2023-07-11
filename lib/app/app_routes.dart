import 'package:flutter_homework/pages/home/home_page.dart';
import 'package:flutter_homework/pages/login/login_page.dart';
import 'package:flutter_homework/pages/signup/signup_page.dart';
import 'package:get/get.dart';

class AppRoutes {
    AppRoutes._(); 
    static final routes = [
      GetPage(name: Routes.main, page: () => const LoginPage()),
      GetPage(name: Routes.home, page: () => const HomePage()),
      GetPage(name: Routes.signup, page: () => const SignUpPage()),
    ];
  }

class Routes {
    Routes._();
    static const String main = '/';
    static const String home = '/home';
    static const String signup = '/signup';

  }