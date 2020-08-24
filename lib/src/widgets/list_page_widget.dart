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
              _showMaterialDialog(context);
            },
            child: ListTile(
              leading: Icon(
                Icons.book,
                color: ThemeData().primaryColor,
              ),
              title: Text('Calculo'),
              subtitle: Text('Realiza un nuevo calculo'),
              trailing: Icon(
                Icons.chevron_right,
                color: ThemeData().primaryColor,
              ),
            ),
          ),
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
            onTap: () {
              Get.toNamed(AppRoutes.engorde);
            },
            child: ListTile(
              leading: Icon(
                Icons.dashboard,
                color: ThemeData().primaryColor,
              ),
              title: Text('Engorde'),
              subtitle: Text('Calculo de engorde'),
              trailing: Icon(
                Icons.chevron_right,
                color: ThemeData().primaryColor,
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

  _showMaterialDialog(context) {
    final colorPrimari = ThemeData().primaryColor;
    showDialog(
      context: context,
      barrierColor: Colors.black26,
      builder: (_) => AlertDialog(
        title: Text('Formulacion de balanceado para'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            ListTile(
              onTap: () {
                Get.offNamed(AppRoutes.calculoLeche);
              },
              title: Text('Vacas lecheras'),
              // subtitle: Text('Calculo lecheria'),
              leading: Icon(
                Icons.arrow_right,
                color: colorPrimari,
                size: 30.0,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Get.offNamed(AppRoutes.calculoEngorde);
              },
              // subtitle: Text('Calculo de engorde'),
              title: Text('Ganacia de peso'),
              leading: Icon(
                Icons.arrow_right,
                color: colorPrimari,
                size: 30.0,
              ),
            ),
            Divider(),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cerrar'),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
