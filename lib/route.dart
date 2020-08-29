import 'package:control_animal_app/src/pages/calculo_engorde/calculo_engorde.dart';
import 'package:control_animal_app/src/pages/calculo_leche/calculo_leche.dart';
import 'package:control_animal_app/src/pages/engorde/engorde_page.dart';
import 'package:control_animal_app/src/pages/lecheria/lecheria_page.dart';
import 'package:control_animal_app/src/pages/welcome/welcome_page.dart';
import 'package:get/get.dart';
import 'src/pages/auth/auth_page.dart';
import 'src/pages/home/home_page.dart';
import 'src/pages/register/register_page.dart';

abstract class AppRoutes {
  static const auth = 'auth';
  static const register = 'register';
  static const home = 'home';
  static const lecheria = 'lecheria';
  static const engorde = 'engorde';
  static const calculoLeche = 'calculo_leche';
  static const calculoEngorde = 'calculo_engorde';
  static const welcome = 'welcome';
}

class AppPage {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.auth, page: () => AuthPage()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.lecheria, page: () => LecheriaPage()),
    GetPage(name: AppRoutes.engorde, page: () => EngordePage()),
    GetPage(name: AppRoutes.calculoLeche, page: () => CalculoLechePage()),
    GetPage(name: AppRoutes.calculoEngorde, page: () => CalculoEngordePage()),
    GetPage(name: AppRoutes.welcome, page: () => WelcomePage()),
  ];
}
