import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/modules/login/controllers/login_controller.dart';

import '../../../configs/configs.dart';
import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());



    return Scaffold(


      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () => Get.toNamed(Routes.ONBOARDING),
      //   ),
      //   title: Text("Login", style: TextStyle(color: kPrimaryTextColor),),
      //     backgroundColor : kBackgroundColor1 ,
      // ),
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 70,
                          child: Image.asset("assets/images/logo_splash.png")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 8.0),
                        child: Text("Sign Up",
                            style: TextStyle(
                                fontFamily: 'Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 34)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Hi, Please fill the information to complete the log in ",
                          style: TextStyle(
                              fontFamily: 'Sans',
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: controller.signupFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: controller.usernameController,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                      ),
                                      onSaved: (value) {
                                        controller.username = value;
                                      },
                                      validator: (value) {
                                        return controller.validateUser(value!);
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                      ),
                                      onSaved: (value) {
                                        controller.email = value;
                                      },
                                      validator: (value) {
                                        return controller.validateEmail(value!);
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    Obx(
                                      () => TextFormField(
                                        controller:
                                            controller.passwordController,
                                        obscureText:
                                            controller.obscureText.value
                                                ? true
                                                : false,
                                        onSaved: (value) {
                                          controller.password = value;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                              enableFeedback: true,
                                              icon: Icon(
                                                controller.obscureText.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                              onPressed: () {
                                                controller.toggleObscureText();
                                              }),
                                        ),
                                        validator: (value) {
                                          return controller
                                              .validatePassword(value!);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProperHeight(10),
                                    ),
                                    GestureDetector(
                                        child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text('Forgot Password ?',
                                                textAlign: TextAlign.start,
                                                textWidthBasis:
                                                    TextWidthBasis.parent)),
                                        onTap: () {}),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: kPrimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    controller.checklogin();
                                    // Add your onPressed action here
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Your existing widget tree here

                                    SizedBox(height: 16),

                                    Text("or"),

                                    SizedBox(height: 16),

                                    GestureDetector(
                                      onTap: () {
                                        // Handle the login action here
                                        Get.back();
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: kSubtitleTextColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
