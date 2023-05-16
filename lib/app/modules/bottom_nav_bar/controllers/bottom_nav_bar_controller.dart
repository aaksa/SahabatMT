import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class BottomNavBarController extends GetxController {
  //TODO: Implement BottomNavBarController

  final currentIndex = 0.obs;
  final count = 0.obs;

  void goToPage(int index) {
    // * to check current page before navigation

    if (index != 2) {
      currentIndex.value = index;
    }
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.MARKET);
        break;
      case 2:
        Get.toNamed(Routes.UPLOAD);
        break;
      case 3:
        Get.toNamed(Routes.RIWAYAT_TRANSAKSI);
        break;
      case 4:
        Get.toNamed(Routes.ACCOUNT);
        break;
      default:
    }
  }

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
