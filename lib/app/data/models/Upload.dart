class Upload {
  int? id, kuantitas, userId, harga;
  String? nama, gambar, deskripsi, kondisi, alamat, provinsi, created;

  Upload({
    this.id,
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
  });

  Upload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambar = json['gambar'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    kondisi = json['kondisi'];
    alamat = json['bekas'];
    kuantitas = json['kuantitas'];
    provinsi = json['provinsi'];
    created = json['create_at'];
  }
}
