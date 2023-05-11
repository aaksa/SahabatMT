import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../../configs/configs.dart';
import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/shipping_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressView extends GetView<ShippingAddressController> {
  // final ShippingController controller = Get.put(ShippingAddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(
          title: "Shipping Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Provinsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Obx(() => DropdownButtonFormField(
                    value: controller.selectedProvince.value,
                    items: controller.provinceList
                        .map((province) => DropdownMenuItem(
                              value: province,
                              child: Text(province),
                            ))
                        .toList(),
                    onChanged: (selectedValue) =>
                        controller.selectedProvince.value = selectedValue!,
                    decoration: InputDecoration(
                      hintText: 'Select province',
                    ),
                  )),
              SizedBox(height: 16),
              Text(
                'Kota',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Obx(() => DropdownButtonFormField(
                    value: controller.selectedKota.value,
                    items: controller.kotaList
                        .map((province) => DropdownMenuItem(
                              value: province,
                              child: Text(province),
                            ))
                        .toList(),
                    onChanged: (selectedValue) {
                      controller.selectedKota.value = selectedValue!;
                      controller.onkirdong(selectedValue);
                    },
                    decoration: InputDecoration(
                      hintText: 'Select province',
                    ),
                  )),
              SizedBox(height: 16),
              Text(
                'Ongkos Kirim',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.ongkoskirim.value,
                      readOnly: true, // set this to true
                      decoration: InputDecoration(
                        hintText: 'Ongkos Kirim',
                      ),
                    ),
                  ),
                ],
              ),

              //end
              SizedBox(height: 16),
              Text(
                'Kecamatan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Obx(
                    () => Expanded(
                      child: TextFormField(
                        controller: controller.kecamatan.value,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Kecamatan',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(kBackgroundColor1),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryLightColor)),
                    onPressed: () {
                      controller.setKecamatan();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Text(
                'Kelurahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.kelurahan.value,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Kelurahan',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(kBackgroundColor1),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryLightColor)),
                    onPressed: () {
                      controller.setKelurahan();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Jalan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.jalan.value,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Jalan',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(kBackgroundColor1),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryLightColor)),
                    onPressed: () {
                      controller.setJalan();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Text(
                'Nomor Handphone',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.nomorHandphone.value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nomor Handphone',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(kBackgroundColor1),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryLightColor)),
                    onPressed: () {
                      controller.setNomor();
                      // final shipping =
                      //     controller.shippingBillController.value.text;
                      // // Add the shipping to the list in the controller
                      // controller.shippingList.add(shipping);
                      // // Clear the text field
                      // controller.shippingBillController.value.clear();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: DropdownButtonFormField(
              //         value: controller.selectedShipping.value,
              //         items: controller.dropdownValues
              //             .map((shipping) => DropdownMenuItem(
              //                   value: shipping,
              //                   child: Text(shipping),
              //                 ))
              //             .toList(),
              //         onChanged: (selectedValue) {
              //           // Set the selected shipping value in the controller
              //           controller.selectedShipping.value = selectedValue!;
              //           // Add the shipping to the list in the controller
              //           controller.shippingList.add(selectedValue!);
              //         },
              //         decoration: InputDecoration(
              //           hintText: 'Select shipping',
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 16),

              SizedBox(height: getProperHeight(32)),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(kBackgroundColor1),
                    backgroundColor:
                        MaterialStateProperty.all(kPrimaryLightColor)),
                onPressed: () {
                  controller.setaddress();
                  Get.toNamed(Routes.PAYMENT, arguments: controller.addplusnum);
                  // Handle button press
                },
                child: Text(
                  'Buat Orderan',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ShippingAddressView extends GetView<ShippingAddressController> {
//   const ShippingAddressView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ShippingAddressView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'ShippingAddressView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
