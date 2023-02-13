import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/else/text_utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/login');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white ,
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'If you want to recover your account, then please provide your email ID below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 300,
                ),
                SizedBox(
                  height: 50,
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
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_){
                  return ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          controller.resetPassword(emailController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 50),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextUtils(
                        text: 'SEND',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
