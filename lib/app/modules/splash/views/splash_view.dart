import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(0, 0, 102, 1), Color.fromRGBO(0, 0, 110, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
        ),
        child: Center(
          child: Image.asset(
            "assets/logo2.png",
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.width/4,
          ),
        ),
      ),
    );
  }
}
