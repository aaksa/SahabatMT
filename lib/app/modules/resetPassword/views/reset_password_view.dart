import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../widgets/appbarviews.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({Key? key}) : super(key: key);

  final controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(
          title: 'Lupa Password',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => controller.setEmail(value),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
            ),
            TextField(
              onChanged: (value) => controller.setEmail(value),
              decoration: InputDecoration(
                labelText: 'Token',
                hintText: 'Enter your Token',
              ),
            ),
            SizedBox(height: 16),
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryLightColor)),
                        onPressed: controller.isSuccess.value
                            ? null
                            : controller.sendResetPasswordRequest,
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text('Reset Token Email'),
                      ),
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryLightColor)),
                        onPressed: controller.isempty.value
                            ? null
                            : controller.sendResetPasswordRequest,
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text('Send Token'),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
