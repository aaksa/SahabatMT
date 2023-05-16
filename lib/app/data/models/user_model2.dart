class UserModel2 {
  String? id;
  String? nama, nomorHp, email, token;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? jalan;
  String? alamatLengkap;

  UserModel2({
    this.id,
    this.nama,
    this.nomorHp,
    this.email,
    this.token,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.kelurahan,
    this.jalan,
    this.alamatLengkap,
  });

  UserModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nama = json['nama'];
    nomorHp = json['nomor_hp'].toString();
    email = json['email'];
    token = json['token'];
    provinsi = json['Provinsi'];
    kota = json['Kota'];
    kecamatan = json['Kecamatan'];
    kelurahan = json['Kelurahan'];
    jalan = json['Jalan'];
    alamatLengkap = json['alamat_lengkap'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': int.tryParse(id!),
      'nama': nama,
      'nomor_hp': nomorHp,
      'email': email,
      'token': token,
      'Provinsi': provinsi,
      'Kota': kota,
      'Kecamatan': kecamatan,
      'Kelurahan': kelurahan,
      'Jalan': jalan,
      'alamat_lengkap': alamatLengkap,
    };
  }
}
