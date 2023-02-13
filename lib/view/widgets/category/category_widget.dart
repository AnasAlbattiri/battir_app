import 'package:e_commerce/logic/controller/category_controller.dart';
import 'package:e_commerce/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isCategoryLoading.value){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  controller.getCategoryIndex(index);
                  Get.to(CategoryItems(
                    categoryTitle: controller.categoryNameList[index]!,
                  ));
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          controller.categoriesImages[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      controller.categoryNameList[index]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        backgroundColor: Colors.black38,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    });
  }
}
