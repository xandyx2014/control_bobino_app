import 'package:control_animal_app/src/controller/dato_animal_controller.dart';
import 'package:control_animal_app/src/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Get.put(GlobalController());
    Get.put(DatoAnimalController());
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.auth,
      theme: ThemeData(
        primaryColor: Colors.green[300],
      ),
      // routes: routesPages,
      getPages: AppPage.routes,
    );
  }
}
