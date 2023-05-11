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

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      produk: Produk.fromJson2(json['produk']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'produk': produk!.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return (produk!.harga?.toDouble())! * quantity!;
  }
}
