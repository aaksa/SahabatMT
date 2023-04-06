import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../controllers/itemdetailsscreen_controller.dart';

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final File image = args['image'];
    final String itemName = args['itemName'];
    final Kondisi condition = args['condition'];
    final int quantity = args['quantity'];
    final String type = args['type'];
    final String address = args['address'];
    final String city = args['city'];
    final String province = args['province'];

    // TODO: save item data to a database or send it to a server

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor1,
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        title: appbarviews(
          title: "Item Details",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200, // Set the desired height for the image
                width: double
                    .infinity, // Set the width to fill the available space
                child: Image.file(image,
                    fit: BoxFit
                        .cover), // Use BoxFit.cover to fit the image inside the container
              ),
              SizedBox(height: 16), // Add some spacing between the widgets
              Text('Item Name: $itemName',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8), // Add some spacing between the widgets
              Row(
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 24),
                  SizedBox(width: 8), // Add some spacing between the widgets
                  Text('Quantity: $quantity', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8), // Add some spacing between the widgets
              Text('Kondisi: ${condition.name}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8), // Add some spacing between the widgets
              Text('Tipe: $type', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8), // Add some spacing between the widgets
              Text('Alamat: $address', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Kota dan Provinsi : $city, $province',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
          Get.snackbar(
            'Item Uploaded',
            'Your item has been uploaded successfully',
            duration: Duration(seconds: 3),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
