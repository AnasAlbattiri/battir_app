import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Cart is ',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Empty',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Add items to get started',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/main');
              },
              child: Text(
                'Go to Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
