import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/else/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  height: 60,
                  width: 190,
                  child: Center(
                    child: TextUtils(
                      text: 'Welcome',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    height: 60,
                    width: 240,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Battir',
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                          text: 'Shop',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                    ),
                    onPressed: () {
                      Get.offNamed('/login');
                    },
                    child: TextUtils(
                      text: 'Get started',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'Don\'t have an Account?',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Get.offNamed('/signup');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            height: 2,
                            color: mainColor,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
