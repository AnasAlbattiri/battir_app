// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/auth/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  // Vars & Else
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'UP',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          textType: TextInputType.text,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Invalid Name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode ? Icon(
                          Icons.person,
                          color: pinkClr,
                          size: 30,
                        ) : Image.asset('assets/images/user.png'),
                          suffixIcon: Text(''),
                          hintText: 'User Name',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          textType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode ? Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          )
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: Text(''),
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText: controller.isVisibility ? false : true,
                              textType: TextInputType.text,
                              validator: (value) {
                                if (value.toString().length < 8) {
                                  return 'Password must be 8 or more characters long';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                Icons.lock,
                                size: 30,
                                color: pinkClr,
                              )
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    controller.isCheckBox == true) {
                                  controller.signUpUsingFirebase(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else if (controller.isCheckBox == false){
                                  Get.snackbar(
                                    'Check Box!',
                                    'You have to accept our terms & conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(360, 50),
                                backgroundColor:
                                    Get.isDarkMode ? pinkClr : mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: TextUtils(
                                text: 'SIGN UP',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ));
                        }),
                      ],
                    ),
                  ),
                ),
                BottomContainer(
                  text: 'Already have an Account?',
                  onPressed: () {
                    Get.offNamed('/login');
                  },
                  textType: 'Log in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
