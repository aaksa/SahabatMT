// // import 'package:sahabatmt/app/data/models/cart.dart';
// // import 'package:sahabatmt/app/data/models/user_model.dart';
// //

// class Transaction {
//   String? id;
//   int? amount;
//   String? customerName;
//   String? customerEmail;
//   String? customerPhone;
//
//   Transaction({
//     this.id,
//     this.amount,
//     this.customerName,
//     this.customerEmail,
//     this.customerPhone,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'amount': amount,
//       'customer_name': customerName,
//       'customer_email': customerEmail,
//       'customer_phone': customerPhone,
//     };
//   }
// }
//
// // class TransactionModel {
// //   int? id, idUsers;
// //
// //   String? alamat, pembayaran, status;
// //
// //   double? totalPembayaran, ongkosKirim, totalJasa;
// //
// //   List<Cart>? cartModel;
// //
// //   UserModel? user;
// //
// //   String? tipePengantaran, namaJasa;
// //
// //   DateTime? createdAt, updatedAt;
// //
// //   TransactionModel({
// //     this.id,
// //     this.idUsers,
// //     this.alamat,
// //     this.pembayaran,
// //     this.status,
// //     this.totalPembayaran,
// //     this.ongkosKirim,
// //     this.namaJasa,
// //     this.totalJasa,
// //     this.tipePengantaran,
// //     this.cartModel,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   TransactionModel.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     idUsers = json['id_users'];
// //     alamat = json['alamat'];
// //     pembayaran = json['pembayaran'];
// //     totalPembayaran = double.parse(json['total_pembayaran'].toString());
// //     ongkosKirim = double.parse(json['ongkos_kirim'].toString());
// //     namaJasa = json['nama_jasa'].toString();
// //     totalJasa = double.parse(json['total_jasa'].toString());
// //     status = json['status'];
// //     createdAt = DateTime.parse(json['created_at']);
// //     updatedAt = DateTime.parse(json['updated_at']);
// //     user = UserModel.fromJson(json['user']);
// //
// //     cartModel = json['items'].map<Cart>((item) => Cart.fromJson(item)).toList();
// //
// //     tipePengantaran = json['tipe_pengantaran'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'id_users': idUsers,
// //       'alamat': alamat,
// //       'pembayaran': pembayaran,
// //       'total_pembayaran': totalPembayaran,
// //       'ongkos_kirim': ongkosKirim,
// //       'nama_jasa': namaJasa,
// //       'total_jasa': totalJasa,
// //       'status': status,
// //       'created_at': createdAt,
// //       'updatedAt': updatedAt,
// //       'user': user!.toJson(),
// //       'items': cartModel!.map((items) => items.toJson()).toList(),
// //       'tipe_pengantaran': tipePengantaran,
// //     };
// //   }
// // }

class Transaction {
  final int id;
  final double grossAmount;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String address;
  final String status;
  final List<PaymentItem> items;

  Transaction({
    required this.id,
    required this.grossAmount,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.address,
    required this.status,
    required this.items,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      grossAmount: double.parse(json['gross_amount']),
      customerName: json['customer_name'],
      customerEmail: json['customer_email'],
      customerPhone: json['customer_phone'],
      address: json['address'],
      status: json['status'],
      items: List<PaymentItem>.from(
        json['items'].map((item) => PaymentItem.fromJson(item)),
      ),
    );
  }
}

class PaymentItem {
  final int id;
  final int paymentId;
  final String productId;
  final String productName;
  final double productPrice;
  final int quantity;

  PaymentItem({
    required this.id,
    required this.paymentId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      id: json['id'],
      paymentId: json['payment_id'],
      productId: json['product_id'],
      productName: json['product_name'],
      productPrice: double.parse(json['product_price']),
      quantity: json['quantity'],
    );
  }
}
