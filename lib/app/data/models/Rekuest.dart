import '../../constants/constants.dart';

class Rekuest {
  int? id, kuantitas, userId, harga;
  String? nama,
      gambar,
      deskripsi,
      kondisi,
      alamat,
      provinsi,
      created,
      pengajuan;

  Rekuest(
      {this.id,
      this.userId,
      this.nama,
      this.gambar,
      this.harga,
      this.deskripsi,
      this.kondisi,
      this.alamat,
      this.kuantitas,
      this.provinsi,
      this.created,
      this.pengajuan});

  Rekuest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambar = json['gambar'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    kondisi = json['kondisi'];
    pengajuan = json['pengajuan'];
    alamat = json['bekas'];
    kuantitas = json['kuantitas'];
    provinsi = json['provinsi'];
    created = json['create_at'];
  }

  String takeImage(String url) {
    return "$baseUrl2/storage/$url";
  }
}
