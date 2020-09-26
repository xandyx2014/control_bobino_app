import 'package:control_animal_app/src/interceptor/auth_interceptor.dart';
import 'package:control_animal_app/src/model/user_model.dart';
import 'package:control_animal_app/src/utils/enviroment_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final _http = new Dio(BaseOptions(
    baseUrl: Enviroment.UrlApi,
  ));
  final GetStorage storage = GetStorage();
  AuthService() {
    this._http.interceptors.add(authInterfector(Get.context));
  }
  Future<UserModel> register(UserModel user) async {
    try {
      Response response = await this._http.post(
        '/auth',
        data: {
          'username': user.username,
          'password': user.password,
          'nombre': user.password
        },
      );
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      this._handleError(e);
      return null;
    }
  }

  Future<UserModel> login(UserModel user) async {
    print(user.toJson());
    try {
      Response response = await this._http.post(
        '/login',
        data: {
          'username': user.username,
          'password': user.password,
        },
      );
      final userResponse = UserModel.fromJson(response.data['data']);
      await storage.write('token', response.data['token']);
      await storage.write('user', userResponse.toJson());
      return userResponse;
    } on DioError catch (e) {
      print('DATO ES ${e.message}');
      // this._handleError(e);
      return null;
    }
  }

  _handleError(DioError e) async {
    Get.back();
    await showDialog(
      context: Get.context,
      child: AlertDialog(
        title: Text('Ups Hubo un error'),
        content: Text(
          e.response.data['message'] ?? 'Error en la aplicacion',
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Aceptar'),
          )
        ],
      ),
    );
  }
}
