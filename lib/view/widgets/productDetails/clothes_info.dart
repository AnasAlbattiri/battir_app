import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final Rating rate;
  final String description;

  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description})
      : super(key: key);

  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '${rate.rate}',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify, // بتبعد الكلمات عن بعض بطريقة معينة
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more ',
            trimExpandedText: ' Show less ',
            lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
