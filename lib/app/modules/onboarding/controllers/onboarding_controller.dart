import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sahabatmt/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final currentIndex = 0.obs;

  PageController pageController = PageController();

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

  void rightTap() {
    if (currentIndex.value != 2) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {

      Get.offAllNamed(Routes.LOGIN);

    }
  }

  //* Function to handle button left

  void leftTap() {
    if (currentIndex.value == 0) {
      pageController.animateToPage(
        currentIndex.value + 2,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.animateToPage(
        currentIndex.value - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
