import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home/card_item.dart';
import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: 'Find Your',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    text: 'INSPIRATION',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                text: 'Categories',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CardItem(),
        ],
      ),
    ));
  }
}
