import 'package:control_animal_app/src/pages/lecheria/lecheria_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/pages/auth/auth_page.dart';
import 'src/pages/home/home_page.dart';
import 'src/pages/register/register_page.dart';

abstract class AppRoutes {
  static const auth = 'auth';
  static const register = 'register';
  static const home = 'home';
  static const lecheria = 'lecheria';
}

class AppPage {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.auth, page: () => AuthPage()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.lecheria, page: () => LecheriaPage()),
  ];
}

final Map<String, WidgetBuilder> routesPages = {
  'auth': (context) => AuthPage(),
  'register': (context) => RegisterPage(),
  'home': (context) => HomePage()
};
