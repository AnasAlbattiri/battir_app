import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.textType,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textType;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
      keyboardType: textType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Get.isDarkMode ? Colors.black : Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Get.isDarkMode ? Colors.grey : Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        filled: true, // هاي استخدمناها عشان نظهر ال fillColor
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // حوالين الفيلد نفسو
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          // focusBorder: لما تكبس على الفيلد في خط بجي من تحت أنا بدي لونو يكون أبيض
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
