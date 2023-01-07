import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constans.dart';
import '../../../data/models/produk_model.dart';
import '../controllers/beranda_controller.dart';
import 'package:http/http.dart' as http;

class DepanView extends GetView<BerandaController> {
  final controller = Get.put(BerandaController());

  @override
  Widget build(BuildContext context) {
    controller.getkategori();
    return Scaffold(
        body: SingleChildScrollView(
      // physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.968,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GetBuilder<BerandaController>(
              builder: (x) => Container(
                height: MediaQuery.of(context).size.height - 100,
                padding: EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: x.kategorilist.length + 1,
                  itemBuilder: (BuildContext context, int i) =>
                      i < x.kategorilist.length
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(x.kategorilist[i].nama.toString())
                                WidgetbyKategori(x.kategorilist[i].id,
                                    x.kategorilist[i].nama.toString(), i)
                              ],
                            )
                          : const SizedBox.shrink(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class WidgetbyKategori extends StatefulWidget {
  final Widget? child;
  final int? id;
  final String kategori;
  final int warna;

  const WidgetbyKategori(this.id, this.kategori, this.warna,
      {Key? key, this.child})
      : super(key: key);

  @override
  _WidgetbyKategoriState createState() => _WidgetbyKategoriState();
}

class _WidgetbyKategoriState extends State<WidgetbyKategori> {
  List<Produk> produklist = [];

  Future<List<Produk>> fetchProduk(String id) async {
    List<Produk> usersList = [];

    var params = "/produkbykategori?id=" + id;
    var sUrl = Uri.parse(Const.sUrl + params);

    try {
      var jsonResponse = await http.get(sUrl);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

        usersList = jsonItems.map<Produk>((json) {
          return Produk.fromJson(json);
        }).toList();

        setState(() {
          produklist = usersList;
        });
      }
    } catch (e) {
      usersList = produklist;
    }
    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.only(right: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.kategori,
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: 200.0,
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Const.colors[widget.warna],
                    boxShadow: [
                      BoxShadow(
                          color: Const.colors[widget.warna], spreadRadius: 1),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text('Selengkapnya',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: const EdgeInsets.only(bottom: 7.0),
            child: FutureBuilder<List<Produk>>(
              future: fetchProduk(widget.id.toString()),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int i) => Card(
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 135.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              Const.sUrl +
                                  snapshot.data![i].thumbnail.toString(),
                              height: 110.0,
                              width: 110.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(snapshot.data![i].judul.toString()),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(snapshot.data![i].harga.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
