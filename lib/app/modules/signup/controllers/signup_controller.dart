import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  String? username;
  String? email;
  String? password;
  String? notif;
  String? nomorHp;
  String? Kecamatan;
  String? Kelurahan;
  String? Jalan;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      nomorController,
      kecamatanController,
      kelurahanController,
      jalanController,
      usernameController;
  var obscureText = true.obs;
  bool isError = false;
  final count = 0.obs;
  final AuthService _authService = AuthService();

  Future<void> register() async {
    try {
      isError = false;
      final isValid = signupFormKey.currentState!.validate();
      signupFormKey.currentState!.save();

      if (isValid) {
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
        var nama = usernameController.text;
        var email = emailController.text;
        var password = passwordController.text;
        var nomorHp = nomorController.text;
        var kecamatan = kecamatanController.text;
        var kelurahan = kelurahanController.text;
        var jalan = jalanController.text;
        var provinsi = selectedProvince.value;
        var kota = cities[0];
        var alamat_lengkap = '$jalan, $kelurahan, $kecamatan, $kota, $provinsi';
        await _authService.register(nama, email, password, nomorHp, provinsi,
            kota, kecamatan, kelurahan, jalan, alamat_lengkap);
        // Get.offAllNamed('/home');
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }

  //
  var selectedProvince = 'Sulawesi Selatan'.obs;
  var cities = [
    'Makassar',
    'Gowa',
    'Maros',
    'Barombong',
  ].obs;

  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    nomorController = TextEditingController();
    kecamatanController = TextEditingController();
    kelurahanController = TextEditingController();
    jalanController = TextEditingController();
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
    nomorController.dispose();
    kecamatanController.dispose();
    kelurahanController.dispose();
    jalanController.dispose();
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

  String? validateInformation(String value) {
    if (value.isEmpty) {
      return 'Please enter your Information';
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void increment() => count.value++;
}
