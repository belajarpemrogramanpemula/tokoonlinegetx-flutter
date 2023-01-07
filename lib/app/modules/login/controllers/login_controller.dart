import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constans.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final getStorage = GetStorage();
  late User user;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  _snack(String tittle, String content, String tipe) {
    Get.snackbar(
      tittle,
      content,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: tipe == "err" ? Colors.red : Colors.green,
    );
  }

  kliklogin(String username, String password) {
    if (username.trim() == "") {
      _snack("Peringatan", "Maaf username kosong", "err");
    } else if (password.trim() == "") {
      _snack("Peringatan", "Maaf password kosong", "err");
    } else {
      var url = Uri.parse(Const.sUrl + "/login");
      var input = json.encode({
        "username": username,
        "password": password,
      });

      http
          .post(
        url,
        headers: {"Content-Type": "application/json"},
        body: input,
      )
          .then((res) {
        if (res.statusCode == 200) {
          var rs = json.decode(res.body);
          if (rs['code'] == "OK") {
            _snack("Informasi", "Login berhasil", "oke");
            getStorage.write("status", "login");
            user = User.fromJson(rs['data']);
            getStorage.write('user', user.toJson());
            Get.offAllNamed(Routes.HOME);
          } else {
            _snack("Peringatan", "Login gagal", "err");
            print(rs['code']);
          }
        } else {
          print("err");
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  kliklogout() {
    getStorage.write("status", "");
    getStorage.write('user', "");
  }

  @override
  void onClose() {}
}
