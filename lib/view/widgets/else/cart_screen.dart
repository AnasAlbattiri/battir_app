import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_product_card.dart';
import 'cart_total.dart';
import 'empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text('Cart Items'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: Icon(
                Icons.backspace,
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.productMap.isEmpty) {
            return EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          index: index,
                          productModel: controller.productMap.keys.toList()[
                              index], // دخلني عالبرودكت ماب وبعدين على الكيز وحطينا دوت ليست لأنه جواتهم البرودكتس مودل عشان شكل ليست وجيبلي عددهم
                          quantity: controller.productMap.values.toList()[
                              index], // quantity: بيمثّل عدد القيم؛ الكمية
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.productMap.length,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
