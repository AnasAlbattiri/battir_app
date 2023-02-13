import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.productModel,
      required this.index,
      required this.quantity})
      : super(key: key);

  final ProductModel productModel;
  final int index;
  final int quantity;

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModel.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title!,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModel);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
