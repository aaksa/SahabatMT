import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/upload/controllers/upload_controller.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../../routes/app_pages.dart';

class UploadView extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(title: "Upload Image"),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
            // your custom back button action here
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                  width: getProperWidht(300),
                  height: getProperHeight(300),
                  child: Obx(() => controller.image.value != null
                      ? Image.file(controller.image.value!)
                      : Container(
                          child: Image.asset('assets/icons/pics.png'),
                        ))),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(kPrimaryLightColor)),
                onPressed: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    controller.image.value = File(pickedFile.path);
                  }
                },
                child: Text('Choose Image'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Item Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
                onChanged: (value) => controller.nama.value = value,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter quantity';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          controller.kuantitas.value = int.tryParse(value) ?? 0,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: controller.kondisi.value,
                      onChanged: (value) => controller.changeCondition(value),
                      items: [
                        DropdownMenuItem(
                          value: 'Baru',
                          child: Text('Baru'),
                        ),
                        DropdownMenuItem(
                          value: 'Bekas',
                          child: Text('Bekas'),
                        ),
                        DropdownMenuItem(
                          value: 'Used',
                          child: Text('Used'),
                        ),
                      ],
                      decoration: InputDecoration(labelText: 'Condition'),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a condition';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
                onChanged: (value) =>
                    controller.harga.value = int.tryParse(value) ?? 0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
                onChanged: (value) => controller.alamat.value = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Province'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a province';
                  }
                  return null;
                },
                onChanged: (value) => controller.province.value = value,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                ),
                onChanged: (value) => controller.deskripsi.value = value,
              ),
              Divider(
                height: 40,
                thickness: 2,
              ),
              ElevatedButton(
                style: butt1,
                onPressed: () async {
                  controller.upload();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
