import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/category_controller.dart';
import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);

  final String categoryTitle;
  final controller = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if(categoryController.isAllCategoriesLoading.value){
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
            ),
            itemBuilder: (context, index) {
              return buildCardItem(
                image: categoryController.categoryList[index]!.image,
                price: categoryController.categoryList[index]!.price,
                rate: categoryController.categoryList[index]!.rating!.rate,
                productId: categoryController.categoryList[index]!.id,
                productModel: categoryController.categoryList[index]!,
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                    productModel: categoryController.categoryList[index]!,
                  ));
                },
              );
            },
          );
        }
      }),
    );
  }

  Widget buildCardItem({
    required String? image,
    required double? price,
    required double? rate,
    required int? productId,
    required ProductModel? productModel,
    required Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.isDarkMode ? darkGreyClr : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId!)
                          ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : Icon(
                        Icons.favorite_border_outlined,
                        color:
                        Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      // color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModel!);
                      },
                      icon: Icon(
                        Icons.shopping_cart_sharp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: NetworkImage(
                    image!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$rate',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
