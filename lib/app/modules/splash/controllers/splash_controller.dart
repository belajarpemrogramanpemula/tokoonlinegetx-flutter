import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';

class SplashController extends GetxController {
  final loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if(loginController.getStorage.read("status") != "" &&
        loginController.getStorage.read("status") != null){
        Get.offAllNamed(Routes.HOME);
    }else{
        Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {}
}
