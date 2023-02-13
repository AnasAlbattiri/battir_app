import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text(controller.titles[controller.currentIndex.value]),
          centerTitle: true,
          actions: [
            Obx(() {
              return badge.Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.scale,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: Image.asset('assets/images/shop.png'),
                ),
              );
            }),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
        ),
      );
    });
  }
}
