import 'package:get/get.dart';

import '../models/kategori_model.dart';

class KategoriProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Kategori.fromJson(map);
      if (map is List)
        return map.map((item) => Kategori.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Kategori?> getKategori(int id) async {
    final response = await get('kategori/$id');
    return response.body;
  }

  Future<Response<Kategori>> postKategori(Kategori kategori) async =>
      await post('kategori', kategori);
  Future<Response> deleteKategori(int id) async => await delete('kategori/$id');
}
