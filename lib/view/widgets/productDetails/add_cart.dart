import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../else/fav_item.dart';
import '../else/text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.price, required this.productModel}) : super(key: key);

  final double price;
  final ProductModel productModel;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "Price",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text(
                '\$ $price',
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
                  cartController.addProductToCart(productModel!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
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
  }
}
