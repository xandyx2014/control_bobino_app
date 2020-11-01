import 'package:controlanimalapp/src/model/user_model.dart';
import 'package:controlanimalapp/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  UserModel user = UserModel();
  AuthService _authService = new AuthService();
  RxBool isOk = false.obs;
  register() async {
    this.isOk.value = true;
    UserModel userResponse = await _authService.register(user);
    Navigator.of(Get.context).pushNamedAndRemoveUntil('auth', (route) => false);
    this.isOk.value = false;
    print(userResponse.toString());
  }

  login() async {
    this.isOk.value = true;
    final userResponse = await _authService.login(user);
    this.isOk.value = false;
    final login = userResponse == null ? false : true;
    if (login) {
      Get.offAllNamed('home');
    }
  }
}
