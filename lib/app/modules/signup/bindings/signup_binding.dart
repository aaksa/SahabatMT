import 'package:get/get.dart';
import 'package:sahabatmt/app/modules/login/controllers/login_controller.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
