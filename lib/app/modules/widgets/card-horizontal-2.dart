import 'package:flutter/material.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/data/models/Rekuest.dart';

class CardHorizontal2 extends StatelessWidget {
  CardHorizontal2(
      {this.title = "Placeholder Title",
      this.cta = "View Article",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc,
      required this.rekuest});

  final String cta;
  final String img;
  final Function()? tap;
  final String title;
  final Rekuest rekuest;

  static void defaultFunc() {
    print("the function works!");
  }

  Color _getColorForPengajuan(String? pengajuan) {
    switch (pengajuan) {
      case "ongoing":
        return Colors.yellow;
      case "rejected":
        return Colors.red;
      case "accepted":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    String nama = rekuest.nama!;
    String harga = rekuest.harga.toString();
    String kondisi = rekuest.kondisi!;
    return Container(
        height: 130,
        margin: EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: tap,
          child: Stack(clipBehavior: Clip.hardEdge, children: [
            Card(
              elevation: 0.7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Row(
                children: [
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama : $nama',
                                style: TextStyle(
                                    color: kPrimaryTextColor, fontSize: 13)),
                            Text('Harga : $harga',
                                style: TextStyle(
                                    color: kPrimaryTextColor, fontSize: 13)),
                            Text('Kondisi : $kondisi',
                                style: TextStyle(
                                    color: kPrimaryTextColor, fontSize: 13)),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: _getColorForPengajuan(rekuest.pengajuan),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                rekuest.pengajuan!,
                                style: TextStyle(
                                  color: kSubtitleTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.09),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 0, left: 13, right: 13),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 16.0, right: 16, bottom: 0, top: 16),
                      height: 127,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 0))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  rekuest.takeImage(rekuest.gambar!)),
                              fit: BoxFit.cover))),
                ),
              ),
            ),
          ]),
        ));
  }
}
