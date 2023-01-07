class Subkategori {
  int? id;
  int? idkategori;
  String? nama;
  String? kategori;

  Subkategori({this.id, this.idkategori, this.nama, this.kategori});

  Subkategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idkategori = json['idkategori'];
    nama = json['nama'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['idkategori'] = idkategori;
    data['nama'] = nama;
    data['kategori'] = kategori;
    return data;
  }
}
