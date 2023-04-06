import 'package:flutter/material.dart';
import 'package:sahabatmt/app/constants/constants.dart';

class CardShopping extends StatelessWidget {
  final String body;
  final bool stock;
  final String price;
  final String img;
  final Function() deleteOnPress;

  CardShopping({
    this.body = "Placeholder Title",
    this.stock = true,
    this.price = "332",
    this.img = "https://via.placeholder.com/200",
    required this.deleteOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 135,
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 65,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        child: Dropdown(
                          key: null,
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(body,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                  stock == true ? 'In Stock' : 'Not In Stock',
                                  style: TextStyle(
                                      color: stock == true ? kSuccess : kAlert,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("\$$price",
                                  style: TextStyle(
                                      color: kPrimaryLightColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            onPressed: () {
                              deleteOnPress();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 11, horizontal: 4),
                              child: Text(
                                "DELETE",
                                style: TextStyle(
                                  color: kBackgroundColor1,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 11.0),
                            ),
                            child: Text(
                              'SAVE FOR LATER',
                              style: TextStyle(
                                color: kBackgroundColor1,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            )
          ]),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
      ),
      FractionalTranslation(
        translation: Offset(0.04, 0.06),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
              height: 80,
              width: 95,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image(image: NetworkImage(img), fit: BoxFit.cover)),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0, 0))
                ],
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              )),
        ),
      ),
    ]);
  }
}

class Dropdown extends StatefulWidget {
  Dropdown({Key? key}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.0,
      child: DropdownButtonHideUnderline(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kPrimaryLightColor,
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 5),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ),
            iconSize: 20,
            elevation: 1,
            style: TextStyle(color: Colors.white),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['1', '2', '3', '4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyle(
                        color: kBackgroundColor1,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0)),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
