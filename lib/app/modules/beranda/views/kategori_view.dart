import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constans.dart';
import '../controllers/beranda_controller.dart';

class KategoriView extends GetView<BerandaController> {
  final controller = Get.put(BerandaController());

  @override
  Widget build(BuildContext context) {
    controller.getkategori();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Const.menuOther,
                  width: 1.0,
                ),
              ),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 1),
              ],
            ),
            child: const Text(
              'KATEGORI PRODUK',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: GetBuilder<BerandaController>(
              builder: (x) =>
                  x.li == 1 ? _widgetKategori() : _widgetSubKategori(),
            ),
          )
        ],
      ),
    );
  }

  Widget _widgetKategori() {
    return GetBuilder<BerandaController>(
      builder: (x) => ListView.builder(
        itemCount: x.kategorilist.length + 1,
        itemBuilder: (BuildContext context, int i) => i < x.kategorilist.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Const.menuOther,
                          width: 1.0,
                        ),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                      ],
                    ),
                    child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
                      leading: const Icon(Icons.group_work),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      title: Text(x.kategorilist[i].nama.toString()),
                      onTap: () {
                        controller.subkategorilist = [];
                        controller.idkategori = x.kategorilist[i].id;
                        controller.namakategori = x.kategorilist[i].nama;
                        controller.li = 2;
                        controller
                            .getsubkategori(x.kategorilist[i].id.toString());
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _widgetSubKategori() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Const.menuOther,
                width: 1.0,
              ),
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.white, spreadRadius: 1),
            ],
          ),
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
            leading: const Icon(Icons.keyboard_arrow_left),
            title: Text(controller.namakategori.toString()),
            onTap: () {
              controller.li = 1;
              controller.update();
            },
          ),
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
            leading: const Text(''),
            title: Text("Lihat semua " + controller.namakategori.toString(),
                style: const TextStyle(color: Colors.blue)),
            onTap: () {},
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.subkategorilist.length,
            itemBuilder: (context, i) {
              return Container(
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
                  leading: const Text(''),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  title: Text(controller.subkategorilist[i].nama.toString()),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
