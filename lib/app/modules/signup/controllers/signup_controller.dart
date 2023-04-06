import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  String? username;
  String? email;
  String? password;
  String? notif;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  late TextEditingController emailController, passwordController, usernameController;
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    signupFormKey.currentState?.dispose();
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
    if(value.isEmpty) {
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
    final isValid = signupFormKey.currentState!.validate();
    signupFormKey.currentState!.save();
    if(!isValid){
      return;
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }


  void increment() => count.value++;
}
