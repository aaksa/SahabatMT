import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../widgets/slider.dart';
import '../controllers/productdetail_controller.dart';

class ProductdetailView extends GetView<ProductdetailController> {
  const ProductdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Product();
  }
}

class Product extends StatelessWidget {
  final double height = 400;
  final String urlImg;
  final String title;

  Product(
      {this.title =
          "Air Conditioner with latest technology available ASFASFASF ASFS asfdasf",
      this.urlImg = "https://via.placeholder.com/550"});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [urlImg, urlImg];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor1,
          iconTheme: IconThemeData(color: kPrimaryTextColor),
          title: appbarviews(
            title: "Details",
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: kBackgroundColor2,
        body: Stack(children: [
          Container(
              height: getProperHeight(1.2) * height,
              child: ImageSlider(imgArray: imgList)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 10,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.0),
                        topRight: Radius.circular(13.0),
                      )),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.56,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Stack(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: SafeArea(
                          bottom: true,
                          top: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 82.0),
                                child: Text(title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://images.unsplash.com/photo-1512529920731-e8abaea917a5?fit=crop&w=840&q=80"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Price",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text("Rp.${100000}",
                                                style: TextStyle(
                                                    color: kPrimaryTextColor)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Deskripsi Produk",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Deskripsi Produk",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))),
                              ),

                              // ProductSizePicker(),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kPrimaryColor)),
                                      child: Text("ADD TO CART",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: kBackgroundColor1))),
                                ),
                              )
                            ],
                          ),
                        )),
                    FractionalTranslation(
                      translation: Offset(-0.04, -0.08),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: kPrimaryColor,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_box),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ])))
        ]));
  }
}
