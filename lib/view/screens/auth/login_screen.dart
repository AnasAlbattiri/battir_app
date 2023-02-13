// ignore_for_file: prefer_const_constructors
import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/auth/check_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // Vars & Else
  final formKey = GlobalKey<FormState>();
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
                    padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        // Email Field
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
                        // Password Field
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
                                color: Get.isDarkMode ? Colors.white : darkGreyClr,
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/forget_password');
                            },
                            child: TextUtils(
                              text: 'Forget Password?',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.logInUsingFirebase(
                                    email: emailController.text,
                                    password: passwordController.text,
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
                                text: 'LOG IN',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ));
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        // TextUtils(
                        //   text: 'OR',
                        //   fontSize: 18,
                        //   fontWeight: FontWeight.w500,
                        //   color: Get.isDarkMode ? Colors.white : Colors.black,
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GetBuilder<AuthController>(builder: (_) {
                        //       return InkWell(
                        //         onTap: () {
                        //           controller.googleSignUpApp();
                        //         },
                        //         child: Image.asset(
                        //           'assets/images/google.png',
                        //           height: 60,
                        //         ),
                        //       );
                        //     }),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                BottomContainer(
                  text: 'Don\'t have an Account?',
                  onPressed: () {
                    Get.offNamed('/signup');
                  },
                  textType: 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
