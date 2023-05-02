import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../../data/models/produk.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../widgets/slider.dart';
import '../controllers/productdetail_controller.dart';

class ProductdetailView extends GetView<ProductdetailController> {
  const ProductdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myProduct = Get.arguments as Produk;
    final String image = myProduct.gambar!;
    final String itemName = myProduct.nama!;
    final String harga = myProduct.harga.toString();
    final String deskripsi = myProduct.deskripsi!;
    var kon = false;
    String condition = '';
    int quantity = 0;
    String address = '';
    String province = '';

    if (myProduct.kondisi == 'baru' || myProduct.kondisi == 'bekas') {
      condition = myProduct.kondisi!;
      quantity = myProduct.kuantitas!;
      address = myProduct.alamat!;
      province = myProduct.provinsi!;
      kon = true;
    }

    return Product(
      produk: myProduct,
      urlImg: image,
      title: itemName,
      deskripsi: deskripsi,
      harga: harga,
      kondisi: condition,
      kon: kon,
    );
  }
}

class Product extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final double height = 400;
  final String urlImg;
  final String title;
  final String deskripsi;
  final String harga;
  final String kondisi;
  final Produk produk;
  final bool kon;

  Product(
      {this.title =
          "Air Conditioner with latest technology available ASFASFASF ASFS asfdasf",
      this.urlImg = "https://via.placeholder.com/550",
      required this.deskripsi,
      required this.harga,
      required this.kondisi,
      required this.produk,
      required this.kon});

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
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      child: SafeArea(
                        bottom: true,
                        top: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Harga: Rp.${harga}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          kon
                                              ? Text("Kondisi: ${kondisi}",
                                                  style: TextStyle(
                                                      color: Colors.black))
                                              : SizedBox.shrink(),
                                          SizedBox(
                                            height: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text("Deskripsi Produk",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            Text(deskripsi,
                                style: TextStyle(color: kPrimaryTextColor)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(produk);
                                    },
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
                      ))))
        ]));
  }
}
