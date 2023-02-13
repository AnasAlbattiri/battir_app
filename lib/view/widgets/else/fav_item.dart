import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


final controller = Get.put(ProductsController());

Widget buildFavItem({
  required String? image,
  required String? title,
  required double? price,
  required int? productId,
}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: SizedBox(
      width: 100,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              controller.manageFavorites(productId!);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
