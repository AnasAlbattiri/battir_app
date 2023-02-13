import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/theme.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(
            builder: (_) {
          return InkWell(
            onTap: () {
              controller.isChecked();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox ? Get.isDarkMode ? Icon(
                Icons.check,
                size: 30,
                color: pinkClr,
              ):  Image.asset('assets/images/check.png'): Container() ,
            ),
          );
        }),
        SizedBox(
          width: 10,
        ),
        Row(
          children: [
            Text(
              'I accept ',
              style: TextStyle(
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              'terms & conditions',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
