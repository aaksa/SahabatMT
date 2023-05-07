import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  String? username;
  String? email;
  String? password;
  String? notif;
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      usernameController;
  final AuthService _authService = AuthService();

  var obscureText = true.obs;
  bool isError = false;

  final count = 0.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      final isValid = loginFormKey.currentState!.validate();
      loginFormKey.currentState!.save();

      if (isValid) {
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
        var email = emailController.text;
        var password = passwordController.text;
        await _authService.login(email, password);
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.back();
      isLoading.value = false;
      print(e.toString());
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onReady() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.onReady();
  }

  @override
  void onClose() {
    loginFormKey.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.onClose();
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateUser(String value) {
    if (value.isEmpty) {
      return 'Please enter your username';
    }
  }

  // validator: (value) {
  // if (value.isEmpty) {
  // return 'Please enter your email';
  // }
  // if (!GetUtils.isEmail(value)) {
  // return 'Please enter a valid email';
  // }
  // return null;
  // },

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  Future<void> checklogin() async {
    isError = false;
    final isValid = loginFormKey.currentState!.validate();
    loginFormKey.currentState!.save();
    login();
  }

  void increment() => count.value++;
}
