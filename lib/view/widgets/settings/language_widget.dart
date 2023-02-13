import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../else/text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Container(
            width: 125,
            padding: EdgeInsets.only(top: 2, right: 3,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 20,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      ' ${english}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      ' ${arabic}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      ' ${france}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: fra,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      ' ${spain}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: spa,
                  ),
                ],
                onChanged: (value) {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
                value: controller.langLocal,
              ),
            ),
          ),
        ],
      ),
    );
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
            color: languageSettings,
          ),
          child: Icon(
            Icons.language,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
          text: 'Language'.tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    ),
  );
}
