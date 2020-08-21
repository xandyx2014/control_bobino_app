import 'package:control_animal_app/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPageWidget extends StatelessWidget {
  const ListPageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.lecheria);
            },
            child: ListTile(
              leading: Icon(
                Icons.dashboard,
                color: ThemeData().primaryColor,
              ),
              title: Text('Lechera'),
              subtitle: Text('Calculo de lecheria'),
              trailing: Icon(
                Icons.chevron_right,
                color: ThemeData().primaryColor,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.dashboard,
                color: ThemeData().primaryColor,
              ),
              title: Text('Engorde'),
              subtitle: Text('Calculo de engorde'),
              trailing: IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: ThemeData().primaryColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Get.offAllNamed(AppRoutes.auth, predicate: (route) => false);
            },
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: ThemeData().primaryColor,
              ),
              title: Text('Salir'),
              subtitle: Text('Cerrar sesion'),
              trailing: Icon(
                Icons.chevron_right,
                color: ThemeData().primaryColor,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
