import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import '../controllers/market_controller.dart';

class SearchBarCustom extends StatelessWidget {
  final MarketController controller = Get.find<MarketController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Adjust the height as needed
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        onChanged: (value) {
          controller.setSearchQuery(value);
          controller.fetchDataForSearch();
        },
        decoration: InputDecoration(
          hintText: 'Cari Ac/Jasa...',
        ),
      ),
    );
  }
}
