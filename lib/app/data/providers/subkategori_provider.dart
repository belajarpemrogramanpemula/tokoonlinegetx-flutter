import 'package:get/get.dart';

import '../models/subkategori_model.dart';

class SubkategoriProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Subkategori.fromJson(map);
      if (map is List)
        return map.map((item) => Subkategori.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Subkategori?> getSubkategori(int id) async {
    final response = await get('subkategori/$id');
    return response.body;
  }

  Future<Response<Subkategori>> postSubkategori(
          Subkategori subkategori) async =>
      await post('subkategori', subkategori);
  Future<Response> deleteSubkategori(int id) async =>
      await delete('subkategori/$id');
}
