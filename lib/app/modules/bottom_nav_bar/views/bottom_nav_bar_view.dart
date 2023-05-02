import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: kBackgroundColor1,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (value) => controller.goToPage(value),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: controller.currentIndex.value == 0
                  ? kPrimaryColor
                  : Color(0xFF808191),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              color: controller.currentIndex.value == 1
                  ? kPrimaryColor
                  : Color(0xFF808191),
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.upload_file_rounded,
              size: 36,
              color: kPrimaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wishlist.svg',
              color: controller.currentIndex.value == 3
                  ? kPrimaryColor
                  : Color(0xFF808191),
            ),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: controller.currentIndex.value == 4
                  ? kPrimaryColor
                  : Color(0xFF808191),
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
