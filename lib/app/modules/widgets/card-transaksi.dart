import 'package:flutter/material.dart';
import 'package:sahabatmt/app/constants/constants.dart';

class CardTransaksi extends StatelessWidget {
  CardTransaksi(
      {this.title = "Placeholder Title",
      this.tap = defaultFunc,
      this.harga = '1000',
      this.quantity = ''});

  final String quantity;
  final String harga;
  final Function()? tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 4),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // <-- add this
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title.toUpperCase(),
                              style: TextStyle(
                                  color: title == 'accepted'
                                      ? Colors.green
                                      : title == 'rejected'
                                          ? Colors.red
                                          : title == 'pending'
                                              ? Colors.amber
                                              : kPrimaryTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              formatPrice(double.parse(harga)),
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "$quantity Produk",
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('Lihat Detail',
                                style: TextStyle(
                                    color: kSubtitleTextColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600))
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
                              image: AssetImage('assets/icons/business1.png'),
                              fit: BoxFit.cover))),
                ),
              ),
            ),
          ]),
        ));
  }
}
