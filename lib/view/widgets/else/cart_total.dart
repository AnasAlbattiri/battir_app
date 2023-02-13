import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key,}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: "Total",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                Text(
                  '\$ ${controller.total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  onPressed: () {
                    Get.toNamed('/payment');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
