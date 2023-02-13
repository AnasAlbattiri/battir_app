import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../else/text_utils.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildIconWidget()),
      ],
    );
  }
}

final controller = Get.find<AuthController>();

Widget buildIconWidget() {
  return GetBuilder<AuthController>(builder: (_){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
        customBorder: StadiumBorder(),
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          Get.defaultDialog(
            title: 'Logout From App',
            titleStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout?',
            middleTextStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
              fontWeight: FontWeight.bold,
            ),
            radius: 12,
            textCancel: 'No',
            cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
            textConfirm: 'Yes',
            confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFromApp();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: logOutSettings,
              ),
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              text: 'Logout'.tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  });
}
