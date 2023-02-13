import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/else/fav_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if(controller.favoritesList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: 'Please, Add your favorite products.',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index){
              return buildFavItem(
                image: controller.favoritesList[index]!.image,
                title: controller.favoritesList[index]!.title,
                price: controller.favoritesList[index]!.price,
                productId: controller.favoritesList[index]!.id,
              );
            },
            separatorBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              );
            },
            itemCount: controller.favoritesList.length,
          );
        }
      }),
    );
  }
}
