import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.switchValue.value = value;
            }),
      ],
    ),);
  }
}

Widget buildIconWidget() {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: Icon(
            Icons.dark_mode,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
          text: 'Dark Mode'.tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    ),
  );
}
