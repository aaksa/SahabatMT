import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahabatmt/app/data/models/produk.dart';
import 'package:sahabatmt/app/modules/cart/controllers/cart_controller.dart';

import '../../../data/models/cart.dart';
import '../../../data/models/user_model2.dart';

class ShippingAddressController extends GetxController {
  //TODO: Implement ShippingAddressController
  var selectedAddress = ''.obs;
  // var selectedShipping = ''.obs;
  var shippingBillController = TextEditingController().obs;
  var dropdownValues = ['Cargo', 'JNE', 'JNT'];
  var selectedShipping = RxString('Cargo');
  var selectedProvince = 'Sulawesi Selatan'.obs;
  var provinceList = ['Sulawesi Selatan', 'Sulawesi'].obs;
  var selectedKota = 'Makassar'.obs;
  var kotaList = ['Makassar', 'Gowa', 'Maros', 'Barombong'].obs;

  // RxString? kecamatan = ''.obs;
  var kecamatan = TextEditingController().obs;
  var ongkoskirim = TextEditingController().obs;

  // RxString? kelurahan = ''.obs;
  var kelurahan = TextEditingController().obs;
  // RxString? jalan = ''.obs;
  var jalan = TextEditingController().obs;
  // RxString? nomorHandphone = ''.obs;
  var nomorHandphone = TextEditingController().obs;

  String address = '';

  final _storage = GetStorage();
  var cartItemsList = RxList<Cart>([]).obs;
  Addresum addplusnum = Addresum(
      number: '', adress: '', city: '', nama: '', email: '', ongkir: '');

  void setaddress() {
    String kelur = kelurahan.value.text;
    String jalanan = jalan.value.text;
    String prov = selectedProvince.value;
    String kot = selectedKota.value;
    String kec = kecamatan.value.text;
    address = '$jalanan $kelur $kec, $prov, ';

    addplusnum.adress = address;
    addplusnum.number = nomorHandphone.value.text;
    addplusnum.city = kot;
    addplusnum.email = userData.value.email ?? '';
    addplusnum.nama = userData.value.nama ?? '';
    addplusnum.ongkir = ongkoskirim.value.text ?? '0';
  }

  void onkirdong(String kota) {
    if (kota == 'Maros' || kota == 'Gowa' || kota == 'Barombong') {
      ongkoskirim.value.text = '15000';
    } else {
      ongkoskirim.value.text = '0';
    }
  }

  String get shipadres => address;
  String get nomor => nomorHandphone.value.text;

  final GetStorage nyimpan = GetStorage();
  var userData = UserModel2().obs;

  void setdata() {
    var box = GetStorage();
    var jsonData = box.read('user');
    if (jsonData != null) {
      userData.value = UserModel2.fromJson(jsonData);
      selectedKota.value = userData.value.kota ?? 'Makassar';
      selectedProvince.value = userData.value.provinsi ?? 'Sulawesi Selatan';
      onkirdong(selectedKota.value);
    }
  }

  void setKecamatan() {
    kecamatan.value.text = userData.value.kecamatan ?? '';
  }

  void setKelurahan() {
    kelurahan.value.text = userData.value.kelurahan ?? '';
  }

  void setJalan() {
    jalan.value.text = userData.value.jalan ?? '';
  }

  void setNomor() {
    nomorHandphone.value.text = userData.value.nomorHp ?? '';
  }

  // var data = Produk().obs;
  var Items = <Produk>[].obs;

  final List<String> shippingList = [
    'JNE',
    'TIKI',
    'POS Indonesia',
  ];

  final count = 0.obs;
  @override
  void onInit() {
    // addToItems();
    setdata();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

class Addresum {
  String nama;
  String email;
  String number;
  String adress;
  String city;
  String ongkir;

  Addresum(
      {required this.number,
      required this.adress,
      required this.city,
      required this.nama,
      required this.email,
      required this.ongkir});
}
