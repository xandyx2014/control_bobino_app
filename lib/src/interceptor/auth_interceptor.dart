import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InterceptorsWrapper authInterfector(BuildContext context) {
  return InterceptorsWrapper(
    onResponse: (e) async {
      return e;
    },
    onError: (DioError e) {},
  );
}
