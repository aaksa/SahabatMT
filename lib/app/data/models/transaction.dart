// import 'package:sahabatmt/app/data/models/cart.dart';
// import 'package:sahabatmt/app/data/models/user_model.dart';
//
class Transaction {
  String? id;
  int? amount;
  String? customerName;
  String? customerEmail;
  String? customerPhone;

  Transaction({
    this.id,
    this.amount,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'customer_phone': customerPhone,
    };
  }
}

// class TransactionModel {
//   int? id, idUsers;
//
//   String? alamat, pembayaran, status;
//
//   double? totalPembayaran, ongkosKirim, totalJasa;
//
//   List<Cart>? cartModel;
//
//   UserModel? user;
//
//   String? tipePengantaran, namaJasa;
//
//   DateTime? createdAt, updatedAt;
//
//   TransactionModel({
//     this.id,
//     this.idUsers,
//     this.alamat,
//     this.pembayaran,
//     this.status,
//     this.totalPembayaran,
//     this.ongkosKirim,
//     this.namaJasa,
//     this.totalJasa,
//     this.tipePengantaran,
//     this.cartModel,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   TransactionModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     idUsers = json['id_users'];
//     alamat = json['alamat'];
//     pembayaran = json['pembayaran'];
//     totalPembayaran = double.parse(json['total_pembayaran'].toString());
//     ongkosKirim = double.parse(json['ongkos_kirim'].toString());
//     namaJasa = json['nama_jasa'].toString();
//     totalJasa = double.parse(json['total_jasa'].toString());
//     status = json['status'];
//     createdAt = DateTime.parse(json['created_at']);
//     updatedAt = DateTime.parse(json['updated_at']);
//     user = UserModel.fromJson(json['user']);
//
//     cartModel = json['items'].map<Cart>((item) => Cart.fromJson(item)).toList();
//
//     tipePengantaran = json['tipe_pengantaran'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'id_users': idUsers,
//       'alamat': alamat,
//       'pembayaran': pembayaran,
//       'total_pembayaran': totalPembayaran,
//       'ongkos_kirim': ongkosKirim,
//       'nama_jasa': namaJasa,
//       'total_jasa': totalJasa,
//       'status': status,
//       'created_at': createdAt,
//       'updatedAt': updatedAt,
//       'user': user!.toJson(),
//       'items': cartModel!.map((items) => items.toJson()).toList(),
//       'tipe_pengantaran': tipePengantaran,
//     };
//   }
// }
