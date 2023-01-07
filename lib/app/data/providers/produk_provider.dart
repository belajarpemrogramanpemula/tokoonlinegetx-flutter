import 'package:get/get.dart';

import '../models/produk_model.dart';

class ProdukProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Produk.fromJson(map);
      if (map is List) return map.map((item) => Produk.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Produk?> getProduk(int id) async {
    final response = await get('produk/$id');
    return response.body;
  }

  Future<Response<Produk>> postProduk(Produk produk) async =>
      await post('produk', produk);
  Future<Response> deleteProduk(int id) async => await delete('produk/$id');
}
