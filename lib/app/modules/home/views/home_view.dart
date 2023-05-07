import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/configs/configs.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/appbarview.dart';
import '../../widgets/card-horizontal.dart';
import '../../widgets/card-small.dart';
import '../../widgets/searchbar.dart';
import '../components/card_caraousel.dart';
import '../controllers/home_controller.dart';
import 'package:sahabatmt/app/data/models/produk.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor1,
          title: appbarview(
            title: "Home",
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future(() async {
              controller.fetchData();
              controller.fetchData2();
            });
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: CarouselScroll(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Produk Terbaru',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LATESTPRODUCT);
                          },
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getProperHeight(200),
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 21),
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.produkList.length,
                          itemBuilder: (context, index) {
                            Produk produk = controller.produkList[index];
                            return CardSmall(
                              title: produk.nama!,
                              img: produk.gambar!,
                              produk: produk,
                            );
                          },
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Layanan Jasa',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LATESTLAYANAN);
                          },
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getProperHeight(200),
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 21),
                    child: Obx(() {
                      if (controller.isLoading2.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.jasaList.length,
                          itemBuilder: (context, index) {
                            Produk produk = controller.jasaList[index];
                            return CardSmall(
                              produk: produk,
                              title: produk.nama!,
                              img: produk.gambar!,
                            );
                          },
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kamu Harus tau !',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   'Lihat Semua',
                        //   style: TextStyle(
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        children: [
                          CardHorizontal(
                            title: 'Pentingnya Membersihkan Air Conditioner',
                            cta: 'Lihat Artikel',
                            img:
                                'https://coolbestaircon.com/wp-content/uploads/2020/11/The-Beginners-Guide-To-Aircon-Installation.png',
                            tap: () {
                              Get.toNamed(Routes.ARTICLE);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBarView());
  }
}

class CarouselScroll extends StatelessWidget {
  const CarouselScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller.buttonCarouselController,
          options: CarouselOptions(
            height: getProperWidht(144),
            onPageChanged: (index, reason) => controller.changePage(index),
            autoPlay: true,
          ),
          items: controller.corousel.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return CardCaraousel(
                  title: i['title'],
                  subtitle: i['subtitle'],
                  img: i['image'],
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Obx(
          () => DotsIndicator(
            dotsCount: 3,
            position: controller.currentIndex.value.toDouble(),
            decorator: DotsDecorator(
              activeColor: kPrimaryColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      ],
    );
  }
}
