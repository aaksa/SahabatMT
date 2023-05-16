import 'dart:io';

// import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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

  BuildContext? context = Get.context;

  final UploadServices _uploadService = UploadServices();

  // Rx<Condition> condition = Rx<Condition>(Condition.baru);
  // Rx<Condition?> condition = Rx<Condition?>(null);

  void changeCondition(String? value) {
    kondisi.value = value!;
  }

  // Future<void> upload() async {
  //   try {
  //     var gambar = this.image;
  //     var nama = this.nama;
  //     var kuantitas = this.kuantitas.value.toString();
  //     var harga = this.harga.value.toString();
  //     var alamat = this.alamat;
  //     var province = this.province;
  //     var pengajuan = this.pengajuan;
  //     var kondisi = this.kondisi;
  //     var deskripsi = this.deskripsi;
  //     print(gambar);
  //
  //     await _uploadService.uploadFile(
  //         gambar.value!,
  //         nama.value,
  //         pengajuan,
  //         harga,
  //         deskripsi.value,
  //         kondisi.value,
  //         alamat.value,
  //         province.value,
  //         kuantitas);
  //     Get.offAllNamed('/home');
  //   } catch (e) {
  //     print(e.toString());
  //     // Get.snackbar('Error', 'Failed to login');
  //   }
  // }

  Future<void> upload() async {
    try {
      // Validate gambar
      if (image.value == null) {
        throw Exception("Gambar Belum Dipilih");
      }

      // Validate nama
      if (nama.value.isEmpty) {
        throw Exception("Nama Barang Kosong");
      }

      // Validate kuantitas
      if (kuantitas.value == null || kuantitas.value == 0) {
        throw Exception("Kuantitas belum terisi");
      }

      // Validate harga
      if (harga.value == null || harga.value == 0) {
        throw Exception("Harga belum terisi");
      }

      // Validate alamat
      if (alamat.value.isEmpty) {
        throw Exception("Masukkan Alamat anda");
      }

      // Validate province
      if (province.value == '') {
        throw Exception("Masukkan Provinsi");
      }
      // Validate deskripsi
      if (deskripsi.value.isEmpty) {
        throw Exception("Masukkan Deskripsi Barang");
      }

      await _uploadService.uploadFile(
        this.image.value!,
        this.nama.value,
        this.pengajuan,
        this.harga.value.toString(),
        this.deskripsi.value,
        this.kondisi.value,
        this.alamat.value,
        this.province.value,
        this.kuantitas.value.toString(),
      );

      QuickAlert.show(
          context: context!,
          type: QuickAlertType.success,
          title: 'Pengajuan Berhasil',
          text: 'Pengajuan Telah Dibuat',
          confirmBtnText: 'Lanjut',
          onConfirmBtnTap: () {
            Get.offAllNamed('/home');
          });
    } catch (e) {
      QuickAlert.show(
        context: context!,
        type: QuickAlertType.error,
        title: 'Data Belum Lengkap',
        text: e.toString(),
      );
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
