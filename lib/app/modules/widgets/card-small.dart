import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahabatmt/app/constants/constants.dart';

import '../../configs/configs.dart';
import '../../routes/app_pages.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
      this.cta = kSubtitleTextColor,
      this.img = "https://via.placeholder.com/200",
      this.tap});

  final Color? cta;
  final String img;
  final Function()? tap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Container(
        height: getProperHeight(200),
        margin: EdgeInsets.only(top: 10),
        child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PRODUCTDETAIL);
            },
            child: Stack(clipBehavior: Clip.hardEdge, children: [
              Card(
                  elevation: 0.7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(flex: 2, child: Container()),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, bottom: 8.0, left: 0.0, right: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 2),
                                  child: Text(title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: 12)),
                                ),
                                Center(
                                  child: Text("View Product",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: kSubtitleTextColor,
                                          fontSize: 11)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  )),
              FractionalTranslation(
                  translation: Offset(0, -0.093),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                            height: getProperHeight(110),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.01),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 0))
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                image: DecorationImage(
                                  image: NetworkImage(img),
                                  fit: BoxFit.cover,
                                ))),
                      )))
            ])),
      ),
    );
  }
}
