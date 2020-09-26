import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InterceptorsWrapper authInterfector(BuildContext context) {
  return InterceptorsWrapper(
    onResponse: (e) async {
      if (e.statusCode == 200) {
        await showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Exito'),
              content: Text('Proceso realizado exitosamente'),
              actions: [
                FlatButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Aceptar'),
                )
              ],
            ));
      }
      return e;
    },
    onError: (DioError e) {},
  );
}
