import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/onboarding/components/page_boarding.dart';

import '../components/left_button.dart';
import '../components/right_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getProperHeight(30),),
            Expanded(
              flex: 7,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) => controller.changePage(index),
                children: [
                  PageOnboarding(alignment: Alignment.topLeft, width: getProperWidht(220), image: 'onboard1', title: "Berkualitas Tinggi", desc: "Temukan solusi lengkap kebutuhan  air conditioner ruangan anda"),
                  PageOnboarding(alignment: Alignment.topLeft, width: getProperWidht(220), image: 'onboard2', title: "Layanan Handal", desc: "Perbaikan yang handal untuk menjaga  kinerja dan umur panjang perangkat"),
                  PageOnboarding(alignment: Alignment.topLeft, width: getProperWidht(220), image: 'onboard3', title: "Jual Beli Mudah", desc: "Jual beli dengan mudah dan nikmati  pengiriman cepat dan aman")


                ],
              ),
            ),
            Expanded(
              flex: 3,
                child: Column(
                  children: [
                    Obx(
                          () => DotsIndicator(
                        dotsCount: 3,
                        position: controller.currentIndex.value.toDouble(),
                        decorator: DotsDecorator(
                          activeColor: kPrimaryColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProperWidht(28),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeftButton(),
                        RightButton(),
                      ],
                    ),

                  ],

                ),
            ),
          ],

        ) ,

      ),
    );
  }
}
