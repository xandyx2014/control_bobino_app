import 'package:flutter/material.dart';
import 'src/pages/auth/auth_page.dart';
import 'src/pages/home/home_page.dart';
import 'src/pages/register/register_page.dart';

final Map<String, WidgetBuilder> routesPages = {
  'auth': (context) => AuthPage(),
  'register': (context) => RegisterPage(),
  'home': (context) => HomePage()
};
