import 'dart:io';

// import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/services/upload_services.dart';

import '../../../constants/constants.dart';

class UploadController extends GetxController {
  // Rx<File> image = Rx<File>(File('path'));
  // Rx<File>? image = Rx<File>(null);
  Rx<File?> image = Rx<File?>(null);

  RxString nama = ''.obs;
  RxInt kuantitas = 0.obs;
  RxInt harga = 0.obs;
  RxString alamat = ''.obs;
  RxString province = ''.obs;
  String pengajuan = 'onGoing';
  RxString kondisi = 'Bekas'.obs;
  RxString deskripsi = ''.obs;

  final UploadServices _uploadService = UploadServices();

  // Rx<Condition> condition = Rx<Condition>(Condition.baru);
  // Rx<Condition?> condition = Rx<Condition?>(null);

  void changeCondition(String? value) {
    kondisi.value = value!;
  }

  Future<void> upload() async {
    try {
      var gambar = this.image;
      var nama = this.nama;
      var kuantitas = this.kuantitas.value.toString();
      var harga = this.harga.value.toString();
      var alamat = this.alamat;
      var province = this.province;
      var pengajuan = this.pengajuan;
      var kondisi = this.kondisi;
      var deskripsi = this.deskripsi;
      print(gambar);
      await _uploadService.uploadFile(
          gambar.value!,
          nama.value,
          pengajuan,
          harga,
          deskripsi.value,
          kondisi.value,
          alamat.value,
          province.value,
          kuantitas);
      Get.offAllNamed('/home');
    } catch (e) {
      print(e.toString());
      // Get.snackbar('Error', 'Failed to login');
    }
  }

  final formKey = GlobalKey<FormState>();

  void saveItem() {
    if (formKey.currentState!.validate()) {
      // Save item data
    }
// * Function to convert label to title
  }
}
