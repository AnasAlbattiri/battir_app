import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class DeliveryContainer extends StatefulWidget {
  const DeliveryContainer({Key? key}) : super(key: key);

  @override
  State<DeliveryContainer> createState() => _DeliveryContainerState();
}

class _DeliveryContainerState extends State<DeliveryContainer> {
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndex = 1;
  bool changeColors = false;
  final controller = Get.put(PaymentController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          buildRadioContainer(
            icon: Container(),
            color: changeColors ? Colors.white : Colors.grey.shade300,
            address: 'Amman, alshona street',
            phone: '788431517',
            name: 'battir store',
            title: 'Battir Shop',
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColors = !changeColors;
              });
            },
            value: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          buildRadioContainer(
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Enter Your Phone Number',
                  content: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black,
                      maxLength: 10,
                      onSubmitted: (value){
                        phoneController.text = value;
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Get.isDarkMode ? pinkClr.withOpacity(0.1) : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  titleStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10,
                  cancelTextColor: Colors.black,
                  textCancel: ' Cancel ',
                  onCancel: () {
                    Get.toNamed('/payment');
                  },
                  confirmTextColor: Colors.black,
                  textConfirm: ' Save ',
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                );
              },
              child: Icon(
                Icons.contact_phone,
                color: Get.isDarkMode ? pinkClr : mainColor,
                size: 20,
              ),
            ),
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            address: controller.address.value,
            phone: controller.phoneNumber.value,
            name: authController.displayUserName.value,
            title: 'Delivery',
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColors = !changeColors;
              });
              controller.updatePosition();
            },
            value: 2,
          ),
        ],
      );
    });
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String title,
    required String name,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith(
              (states) => Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    TextUtils(
                      text: '🇯🇴 +962 ',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
