import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/settings_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatefulWidget {
  ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> with TickerProviderStateMixin {
  final controller = Get.put(SettingsController());
  final authController = Get.find<AuthController>();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      alignment: selected ? Alignment.center : AlignmentDirectional.center,
                      curve: Curves.bounceIn,
                      child: !selected ? Image(image: NetworkImage(
                          'https://icons-for-free.com/iconfiles/png/512/boy+character+man+school+boy+user+icon-1320085976501561317.png',
                        ), width: 50, height: 50,) : Image(
                              image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/128/4939/4939798.png',
                              ),
                              width: 45,
                              height: 45,
                            )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: controller.capitalize(authController.displayUserName.value),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              TextUtils(
                text: authController.displayUserEmail.value,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ],
      );
    });
  }
}
