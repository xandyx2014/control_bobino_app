import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

InterceptorsWrapper authInterfector(BuildContext context) {
  return InterceptorsWrapper(
    onResponse: (e) async {
      return e;
    },
    onError: (DioError e) {},
  );
}
