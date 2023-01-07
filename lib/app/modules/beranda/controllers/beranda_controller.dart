import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constans.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/kategori_model.dart';
import '../../../data/models/subkategori_model.dart';

class BerandaController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Depan'),
    Tab(text: 'Kategori'),
  ];
  
  List<Kategori> kategorilist = [];
List<Subkategori> subkategorilist = [];
int? li = 1;
int? idkategori = 0;
String? namakategori = "";


  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}


  getkategori() {
    var url = Uri.parse(Const.sUrl + "/kategoribyproduk");
    http
        .get(
      url,
      headers: {"Content-Type": "application/json"}
    )
        .then((res) {
      if (res.statusCode == 200) {
        var rs = json.decode(res.body);
        if (rs['code'] == "OK") {
          final jsonItems = rs['data'].cast<Map<String, dynamic>>();
          kategorilist = jsonItems.map<Kategori>((json) {
            return Kategori.fromJson(json);
          }).toList();
          update();
        } else {
          print(rs['message']);
        }
      } else {
        print("err");
      }
    }).catchError((err) {
      print(err);
    });
  }


  getsubkategori(String idkategori) {
    var url = Uri.parse(Const.sUrl + "/subkategoribyproduk?id=" + idkategori);
    http.get(url, headers: {"Content-Type": "application/json"}).then((res) {
      if (res.statusCode == 200) {
        var rs = json.decode(res.body);
        if (rs['code'] == "OK") {
          print(rs['data']);
          final jsonItems = rs['data'].cast<Map<String, dynamic>>();
          subkategorilist = jsonItems.map<Subkategori>((json) {
            return Subkategori.fromJson(json);
          }).toList();
          update();
        } else {
          print(rs['message']);
        }
      } else {
        print("err");
      }
    }).catchError((err) {
      print(err);
    });
  }
  

}
