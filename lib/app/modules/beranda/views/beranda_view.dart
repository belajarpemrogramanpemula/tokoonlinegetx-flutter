import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tokoonline/app/modules/beranda/views/depan_view.dart';
import 'package:tokoonline/app/modules/beranda/views/kategori_view.dart';

import '../../../../constans.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  @override
  Widget build(BuildContext context) {
    final BerandaController _tabs = Get.put(BerandaController());
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70.0,
          title: Text(
            'Beranda',
            style: TextStyle(
              color: Const.hitam,
              fontSize: 18.0,
              // letterSpacing: 5.1,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: PreferredSize(
            child: Container(
              color: Const.abu,
              height: 0.8,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
          // centerTitle: true,
        ),
        body: new Column(children: [
          TabBar(
            controller: _tabs.controller,
            tabs: _tabs.myTabs,
            labelColor: Const.orange,
            unselectedLabelColor: Const.hitam,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0,
                color: Const.orange,
              ),
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabs.controller,
              children: [
               DepanView(),
               KategoriView(),               
              ],
            ),
          )
        ],),);
  }
}
