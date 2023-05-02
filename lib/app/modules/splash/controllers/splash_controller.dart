import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  GetStorage loginState = GetStorage();
  @override
  void onInit() {
    // Timer(Duration(seconds: 3),Get.toNamed(Routes.ONBOARDING) );

    super.onInit();
  }

  @override
  void onReady() {
    loginState.read('token') != null
        ? Get.offNamed(Routes.HOME)
        : Timer(Duration(seconds: 2), goToNewPage);
    super.onReady();
  }

  void goToNewPage() {
    Get.toNamed(Routes.ONBOARDING);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
