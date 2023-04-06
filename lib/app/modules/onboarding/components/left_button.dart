import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../configs/configs.dart';
import '../../../constants/constants.dart';
import '../controllers/onboarding_controller.dart';

class LeftButton extends StatelessWidget {
  const LeftButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.find();

    return GestureDetector(
      onTap: () => controller.leftTap(),
      child: Obx(
        () => Container(
          width: getProperWidht(100),
          padding: EdgeInsets.symmetric(
            vertical: getProperWidht(14),
          ),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Center(
            child: Text(
              controller.currentIndex.value == 0 ? 'SKIP' : 'BACK',
              style: TextStyle(color: kBackgroundColor1, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
