class UserModel {
  int? id;
  String? name, nomorHp, email, token;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? jalan;
  String? alamatLengkap;

  UserModel({
    this.id,
    this.name,
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

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nomorHp = json['nomor_hp'];
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
      'id': id,
      'name': name,
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
