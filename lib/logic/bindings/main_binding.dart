import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import '../controller/payment_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsScreen());
    Get.put(PaymentController(), permanent: true);
  }

}