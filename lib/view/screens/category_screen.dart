import 'package:e_commerce/view/widgets/category/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/else/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          top: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: TextUtils(
                  text: 'Category',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
