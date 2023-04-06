import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';


import '../../../configs/configs.dart';
import '../controllers/onboarding_controller.dart';

class RightButton extends StatelessWidget {
  const RightButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.find();
    return GestureDetector(
      onTap: () => controller.rightTap(),
      child: Obx(
        () => Container(
          width: getProperWidht(100),
          padding: EdgeInsets.symmetric(
            vertical: getProperWidht(14),
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              topLeft: Radius.circular(14),
            ),
          ),
          child: Center(
            child: Text(
              controller.currentIndex.value != 2 ? 'NEXT' : 'START',
              style: TextStyle(fontSize: 16, color: kBackgroundColor1),
            ),
          ),
        ),
      ),
    );
  }
}
