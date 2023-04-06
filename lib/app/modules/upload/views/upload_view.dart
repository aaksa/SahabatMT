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

import '../../itemdetailsscreen/views/itemdetailsscreen_view.dart';

class UploadView extends GetView<UploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(title: "Upload Image"),
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
                    ? Image.file(controller.image.value ?? File(''))
                    : Container(
                        child: Image.network(defaultimg),
                      )),
              ),
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
                onChanged: (value) => controller.itemName.value = value,
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
                          controller.quantity.value = int.tryParse(value) ?? 0,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<Kondisi>(
                      value: controller.condition.value,
                      onChanged: (value) => controller.changeCondition(value!),
                      items: [
                        DropdownMenuItem(
                          value: Kondisi.baru,
                          child: Text('Baru'),
                        ),
                        DropdownMenuItem(
                          value: Kondisi.bekas,
                          child: Text('Bekas'),
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
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a type';
                  }
                  return null;
                },
                onChanged: (value) => controller.type.value = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
                onChanged: (value) => controller.address.value = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a city';
                  }
                  return null;
                },
                onChanged: (value) => controller.city.value = value,
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
              Divider(
                height: 40,
                thickness: 2,
              ),
              ElevatedButton(
                style: butt1,
                onPressed: () {
                  Get.to(
                    ItemDetailsScreen(),
                    arguments: {
                      'image': controller.image.value,
                      'itemName': controller.itemName.value,
                      'quantity': controller.quantity.value,
                      'address': controller.address.value,
                      'city': controller.city.value,
                      'province': controller.province.value,
                      'type': controller.type.value,
                      'condition': controller.condition.value,
                    },
                  );
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
