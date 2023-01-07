import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoonline/app/modules/akun/views/akun_view.dart';
import 'package:tokoonline/app/modules/favorite/views/favorite_view.dart';
import 'package:tokoonline/app/modules/keranjang/views/keranjang_view.dart';
import 'package:tokoonline/app/modules/transaksi/views/transaksi_view.dart';

import '../../../../constans.dart';
import '../../beranda/views/beranda_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              BerandaView(),
              FavoriteView(),
              KeranjangView(),
              TransaksiView(),
              AkunView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Const.bg1,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Const.bg1,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Const.bg2,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Const.bg1,
                ),
                icon: Icon(
                  Icons.favorite_border,
                  color: Const.bg2,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Const.bg1,
                ),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Const.bg2,
                ),
                label: 'Keranjang',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.swap_horiz_sharp,
                  color: Const.bg1,
                ),
                icon: Icon(
                  Icons.swap_horiz_sharp,
                  color: Const.bg2,
                ),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: Const.bg1,
                ),
                icon: Icon(
                  Icons.person_outline,
                  color: Const.bg2,
                ),
                label: 'Akun',
              ),
            ],
          ),
        );
      },
    );
  }
}
