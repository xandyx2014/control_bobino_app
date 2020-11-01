import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

InterceptorsWrapper authInterfector(BuildContext context) {
  return InterceptorsWrapper(
    onResponse: (e) async {
      return e;
    },
    onError: (DioError e) {
      Fluttertoast.showToast(
        msg: '${e.message}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return e;
    },
    onRequest: (options) {
      Fluttertoast.showToast(
        msg: "Tarea realizada correctamente",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return options;
    },
  );
}
