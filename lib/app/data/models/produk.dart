import 'package:sahabatmt/app/constants/constants.dart';

class Produk {
  int? id, kuantitas, harga;
  String? nama, gambar, deskripsi, kondisi, alamat, provinsi, created, updated;

  Produk(
      {this.id,
      this.nama,
      this.gambar,
      this.harga,
      this.deskripsi,
      this.kondisi,
      this.alamat,
      this.kuantitas,
      this.provinsi,
      this.created,
      this.updated});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambar = takeImage(json['gambar']);
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    kondisi = json['kondisi'];
    alamat = json['alamat'];
    kuantitas = json['kuantitas'];
    provinsi = json['provinsi'];
    created = json['create_at'];
    updated = json['updated_at'];
  }

  Produk.fromJson2(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambar = json['gambar'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    kondisi = json['kondisi'];
    alamat = json['alamat'];
    kuantitas = json['kuantitas'];
    provinsi = json['provinsi'];
    created = json['create_at'];
    updated = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'gambar': gambar,
      'harga': harga,
      'deskripsi': deskripsi,
      'kondisi': gambar,
      'alamat': alamat,
      'kuantitas': kuantitas,
      'created_at': created,
      'updated_At': updated,
    };
  }

  String takeImage(String url) {
    return "$baseUrl2/storage/$url";
  }
}

// "data": [
// {
// "id": 21,
// "nama": "corporis",
// "gambar": "images/produk/202304110641-placeholder.png",
// "harga": 372286,
// "deskripsi": "Eos eos porro quasi dolor id deserunt.",
// "kondisi": "bekas",
// "alamat": "2943 Lizeth Gardens\nStiedemannland, ID 75585-5450",
// "kuantitas": 69,
// "provinsi": "Alabama",
// "created_at": "2023-04-11T06:44:05.000000Z",
// "updated_at": "2023-04-11T06:44:05.000000Z"
// },
