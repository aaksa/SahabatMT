import 'cart.dart';

class Order {
  String? nama;
  String? email;

  String? phone;
  String? address;
  String? grossAmount;
  String? namaBarang;
  String? kuantitas;
  String? harga;
  List<Cart>? cartList;

  Order(
      {this.nama,
      this.email,
      this.phone,
      this.address,
      this.grossAmount,
      this.namaBarang,
      this.kuantitas,
      this.harga,
      this.cartList});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      nama: json['nama'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      grossAmount: json['gross_amount'],
      namaBarang: json['nama_barang'],
      kuantitas: json['kuantitas'],
      harga: json['harga'],
      cartList: List<Cart>.from(json['cartList'].map((x) => Cart.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['gross_amount'] = this.grossAmount;
    data['nama_barang'] = this.namaBarang;
    data['kuantitas'] = this.kuantitas;
    data['harga'] = this.harga;
    data['cartList'] = cartList?.map((x) => x.toJson()).toList();
    return data;
  }
}
