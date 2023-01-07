import 'package:get/get.dart';

import 'package:tokoonline/app/modules/akun/bindings/akun_binding.dart';
import 'package:tokoonline/app/modules/akun/views/akun_view.dart';
import 'package:tokoonline/app/modules/beranda/bindings/beranda_binding.dart';
import 'package:tokoonline/app/modules/beranda/views/beranda_view.dart';
import 'package:tokoonline/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:tokoonline/app/modules/favorite/views/favorite_view.dart';
import 'package:tokoonline/app/modules/home/bindings/home_binding.dart';
import 'package:tokoonline/app/modules/home/views/home_view.dart';
import 'package:tokoonline/app/modules/keranjang/bindings/keranjang_binding.dart';
import 'package:tokoonline/app/modules/keranjang/views/keranjang_view.dart';
import 'package:tokoonline/app/modules/login/bindings/login_binding.dart';
import 'package:tokoonline/app/modules/login/views/login_view.dart';
import 'package:tokoonline/app/modules/splash/bindings/splash_binding.dart';
import 'package:tokoonline/app/modules/splash/views/splash_view.dart';
import 'package:tokoonline/app/modules/transaksi/bindings/transaksi_binding.dart';
import 'package:tokoonline/app/modules/transaksi/views/transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => BerandaView(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => KeranjangView(),
      binding: KeranjangBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => TransaksiView(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => AkunView(),
      binding: AkunBinding(),
    ),
  ];
}
