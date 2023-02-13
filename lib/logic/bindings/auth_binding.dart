import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}