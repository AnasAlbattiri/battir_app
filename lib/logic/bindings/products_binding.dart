import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/category_controller.dart';
import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:get/get.dart';

class ProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController()); // بتشتغل اول ما الابلكيشن يشتغل
    Get.lazyPut(() => CartController()); // ما بتشتغل الّا لما اشغلّها
    Get.put(CategoryController());
  }

}