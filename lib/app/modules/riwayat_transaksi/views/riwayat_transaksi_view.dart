import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sahabatmt/app/modules/widgets/card-transaksi.dart';

import '../../../constants/constants.dart';
import 'package:sahabatmt/app/data/models/transaction.dart';
import '../../../routes/app_pages.dart';
import '../../bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../../widgets/appbarviews.dart';
import '../controllers/riwayat_transaksi_controller.dart';

class RiwayatTransaksiView extends GetView<RiwayatTransaksiController> {
  const RiwayatTransaksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(title: "Transaksi"),
      ),
      // color: title == 'accepted'
      //     ? Colors.green
      //     : title == 'rejected'
      body: Obx(
        () => controller.transaksiData.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/business3.png'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text('Anda Belum Memiliki Riwayat Transaksi Sama Sekali')
                  ],
                ),
              ))
            : RefreshIndicator(
                onRefresh: () {
                  return Future(() async {
                    controller.getTransaction();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    final latestData =
                        controller.transaksiData.toList().reversed.toList();

                    final table = Table(
                      border: TableBorder.all(color: Colors.grey),
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Text(
                              'Nama Produk',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              'Harga',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                        ...latestData
                            .expand((data) => data.items)
                            .map((item) => TableRow(children: [
                                  TableCell(child: Text(item.productName)),
                                  TableCell(
                                      child:
                                          Text(item.productPrice.toString())),
                                ]))
                            .toList(),
                      ],
                    );

                    return ListView.builder(
                      itemCount: latestData.length,
                      itemBuilder: (context, index) {
                        final List<PaymentItem> items = latestData[index].items;
                        QuickAlertType alertType;
                        switch (latestData[index].status) {
                          case 'pending':
                            alertType = QuickAlertType.info;
                            break;
                          case 'accepted':
                            alertType = QuickAlertType.success;
                            break;
                          case 'rejected':
                            alertType = QuickAlertType.error;
                            break;
                          case 'refunded':
                            alertType = QuickAlertType.confirm;
                            break;
                          default:
                            alertType = QuickAlertType.info;
                            break;
                        }
                        return CardTransaksi(
                          title: latestData[index].status ?? "Error",
                          harga: latestData[index].grossAmount.toString() ?? "",
                          quantity:
                              latestData[index].items.length.toString() ?? "",
                          tap: () {
                            QuickAlert.show(
                              context: context,
                              type: alertType,
                              text: '',
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          TableCell(
                                            child: Text(
                                              'Nama Produk',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          TableCell(
                                            child: Text(
                                              'Harga',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: items.length,
                                    itemBuilder: (context, itemIndex) {
                                      PaymentItem item = items[itemIndex];

                                      var harga =
                                          formatPrice(item.productPrice);

                                      return Table(
                                        border:
                                            TableBorder.all(color: Colors.grey),
                                        children: [
                                          TableRow(children: [
                                            TableCell(
                                                child: Text(
                                              item.productName,
                                              textAlign: TextAlign.center,
                                            )),
                                            TableCell(
                                                child: Text(
                                              harga,
                                              textAlign: TextAlign.center,
                                            )),
                                          ]),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                              title: latestData[index].status.toUpperCase(),
                            );
                          },
                        );

                        // return CardHorizontal3(
                        //     title: latestData[index].nama ?? 'Error',
                        //     img: latestData[index].gambar ?? 'Error',
                        //     harga: formatPrice(latestData[index].harga?.toDouble() ?? 0)
                        //         .toString() ??
                        //         "Error",
                        //     // kondisi: latestData[index].kondisi ?? "Error",
                        //     // cta: latestData[index].harga.toString() ?? 'Error',
                        //     cta: 'Lihat Produk',
                        //     tap: () {
                        //       Get.toNamed(Routes.PRODUCTDETAIL,
                        //           arguments: latestData[index]);
                        //     });
                      },
                    );
                  }),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
