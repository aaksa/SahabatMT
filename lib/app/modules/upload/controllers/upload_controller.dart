import 'dart:io';

// import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';

class UploadController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  RxString itemName = RxString('');
  RxInt quantity = RxInt(0);
  RxString address = RxString('');
  RxString city = RxString('');
  RxString province = RxString('');
  RxString type = RxString('');
  // Rx<Condition> condition = Rx<Condition>(Condition.baru);
  // Rx<Condition?> condition = Rx<Condition?>(null);
  Rx<Kondisi> condition = Rx<Kondisi>(Kondisi.baru);

  void changeCondition(Kondisi value) {
    condition.value = value;
  }

  final formKey = GlobalKey<FormState>();

  void saveItem() {
    if (formKey.currentState!.validate()) {
      // Save item data
    }
// * Function to convert label to title
  }
}
