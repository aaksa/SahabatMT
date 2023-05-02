import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  String? username;
  String? email;
  String? password;
  String? notif;

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
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  Future<void> login() async {
    try {
      var email = emailController.text;
      var password = passwordController.text;
      await _authService.login(email, password);
      Get.offAllNamed('/home');
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to login');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    loginFormKey.currentState?.dispose();
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
