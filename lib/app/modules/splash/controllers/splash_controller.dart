import 'dart:async';
import 'package:get/get.dart';
import 'package:sahabatmt/app/routes/app_pages.dart';
class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // Timer(Duration(seconds: 3),Get.toNamed(Routes.ONBOARDING) );
    Timer(Duration(seconds: 2), goToNewPage);
  }

  @override
  void onReady() {
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
