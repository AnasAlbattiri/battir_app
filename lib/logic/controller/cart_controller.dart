import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/products_model.dart';
import '../../utils/theme.dart';
import '../../view/widgets/else/fav_item.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModel productModel){
    if(productMap.containsKey(productModel)){
      productMap[productModel] += 1;
    } else {
      productMap[productModel] = 1;
    }
  }

  get productSubTotal => productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element);


  void removeProductsFromCart(ProductModel productModel){
    if(productMap.containsKey(productModel) && productMap[productModel] == 1){
      productMap.removeWhere((key, value) => key == productModel);
    } else {
      productMap[productModel] -= 1;
    }
  }

  void removeOneProduct(ProductModel productModel){
    productMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts(){
    Get.defaultDialog(
      title: 'Clear Products',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Get.isDarkMode ? pinkClr : mainColor,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to clear all products?',
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Get.isDarkMode ? Colors.white : darkGreyClr,
        fontWeight: FontWeight.bold,
      ),
      radius: 12,
      textCancel: 'No',
      cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      textConfirm: 'Yes',
      confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onCancel: (){
        Get.toNamed('/cart');
      },
      onConfirm: (){
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  int quantity(){
    if(productMap.isEmpty){
      return 0;
    } else {
      return productMap.entries.map((e) => e.value).reduce((value, element) => value + element);
    }
  }

  // هذا المقصود بالكي
  // Map<dynamic, dynamic> productMap = {
  //   "a" =  [
  //     ProductModel(
  //       id: 1,
  //       title: "Anas",
  //       image: "IMage",
  //       price: 12.0,
  //       description: "DDDE",
  //       category: null,
  //       rating: Rating.fromJson({}),
  //     ),
  //   ],
  //
  // };

}