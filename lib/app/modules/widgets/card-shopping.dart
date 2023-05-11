import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:sahabatmt/app/constants/constants.dart';

class CardShopping extends StatelessWidget {
  final String? body;
  final bool? stock;
  final String? price;
  final String? img;
  final int? kuantitas;
  final Function() deleteOnPress;
  final Function(int) update;
  final RxList<int> list;
  final int selectedValue;
  CardShopping({
    this.body = "Placeholder Title",
    this.stock = true,
    this.price = "332",
    this.img = "https://via.placeholder.com/200",
    required this.deleteOnPress,
    required this.kuantitas,
    required this.update,
    required this.list,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    int quantity = 0;
    return Stack(children: [
      Container(
        height: 135,
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    height: 25,
                  ),
                  Container(
                    width: 100,
                    height: 42,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kPrimaryLightColor),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: Dropdown(
                              kuantitass: update,
                              list: list,
                              selectedValues: selectedValue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ])),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(body!,
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
                              child: Text("$price,-",
                                  style: TextStyle(
                                      color: kPrimaryLightColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      )
                    ]),
              ),
            )
          ]),
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
                  child: Image(image: NetworkImage(img!), fit: BoxFit.cover)),
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

// class Dropdown extends StatelessWidget {
//   final Function(int) kuantitass;
//
//   Dropdown({Key? key, required this.kuantitass}) : super(key: key);
//
//   final RxString dropdownValue =
//       '1'.obs; // Create RxString to hold dropdown value
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => SizedBox(
//           // Use Obx to rebuild widget when dropdownValue changes
//           width: 100,
//           height: 35,
//           child: DropdownButton<String>(
//             value: dropdownValue
//                 .value, // Use dropdownValue value as value for DropdownButton
//             onChanged: (String? newValue) {
//               dropdownValue.value =
//                   newValue!; // Update dropdownValue value when dropdown value changes
//               kuantitass(int.parse(
//                   newValue)); // Call kuantitass function with new value
//             },
//             items: <String>['1', '2', '3', '4'] // Example dropdown items
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ));
//   }
// }
class Dropdown extends StatelessWidget {
  final Function(int) kuantitass;
  final RxList<int> list;
  int selectedValues;
  Dropdown(
      {Key? key,
      required this.kuantitass,
      required this.list,
      required this.selectedValues})
      : super(key: key);

  // String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 14.0,
        child: DropdownButtonHideUnderline(
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: kPrimaryLightColor,
            ),
            child: DropdownButton<int>(
              value: selectedValues,
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
              onChanged: (int? newValue) {
                selectedValues = newValue!;
                kuantitass(newValue);
              },
              items: list
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString(),
                            style: TextStyle(
                                color: kBackgroundColor1,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0)),
                      ))
                  .toList(),

              // DropdownButtonFormField(
              //   value: controller.selectedKota.value,
              //   items: controller.kotaList
              //       .map((province) => DropdownMenuItem(
              //     value: province,
              //     child: Text(province),
              //   ))
              //       .toList(),
              //   onChanged: (selectedValue) =>
              //   controller.selectedKota.value = selectedValue!,
              //   decoration: InputDecoration(
              //     hintText: 'Select province',
              //   ),
              // )
            ),
          ),
        ),
      ),
    );
  }
}
