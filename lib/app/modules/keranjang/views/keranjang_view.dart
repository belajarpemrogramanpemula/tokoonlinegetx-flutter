import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeranjangView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KeranjangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
