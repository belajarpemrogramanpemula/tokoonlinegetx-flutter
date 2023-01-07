class Produk {
  int? id;
  int? idkategori;
  String? judul;
  String? harga;
  String? hargax;
  String? deskripsi;
  String? thumbnail;

  Produk(
      {this.id,
      this.idkategori,
      this.judul,
      this.harga,
      this.hargax,
      this.deskripsi,
      this.thumbnail});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idkategori = json['idkategori'];
    judul = json['judul'];
    harga = json['harga'];
    hargax = json['hargax'];
    deskripsi = json['deskripsi'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['idkategori'] = idkategori;
    data['judul'] = judul;
    data['harga'] = harga;
    data['hargax'] = hargax;
    data['deskripsi'] = deskripsi;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
