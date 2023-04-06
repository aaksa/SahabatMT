import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';
import '../../routes/app_pages.dart';

class appbarview extends StatelessWidget {
  final title;

  const appbarview({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/logo_splash.png'),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryTextColor),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
              icon: Icon(
                Icons.notifications,
                color: kPrimaryTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: kPrimaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
