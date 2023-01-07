class User {
  int? id;
  String? username;
  String? nama;
  String? email;
  String? level;
  String? foto;

  User({this.id, this.username, this.nama, this.email, this.level, this.foto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    email = json['email'];
    level = json['level'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['nama'] = nama;
    data['email'] = email;
    data['level'] = level;
    data['foto'] = foto;
    return data;
  }
}
