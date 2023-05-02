class UserModel {
  int? id;
  String? name, nomorHp, email, token;

  UserModel({
    this.id,
    this.name,
    this.nomorHp,
    this.email,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nomorHp = json['nomor_hp'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nomor_hp': nomorHp,
      'email': email,
      'token': token,
    };
  }
}
