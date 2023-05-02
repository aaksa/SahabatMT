import 'package:sahabatmt/app/data/models/produk.dart';

class Cart {
  int? id;
  Produk? produk;
  int? quantity;

  Cart({
    this.id,
    this.produk,
    this.quantity,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    produk = Produk.fromJson(json['produk']);
    quantity = json['kuantitas'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hasil_tangkapan': produk!.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return produk!.harga! * quantity! as double;
  }
}
