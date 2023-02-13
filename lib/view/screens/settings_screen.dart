import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/else/text_utils.dart';
import '../widgets/settings/dark_mode.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_button.dart';
import '../widgets/settings/profile_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(height: 20,),
          TextUtils(
            text: 'GENERAL'.tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          const SizedBox(height: 20,),
          DarkModeWidget(),
          const SizedBox(height: 20,),
          LanguageWidget(),
          const SizedBox(height: 20,),
          LogoutWidget(),
        ],
      ),
    );
  }
}
