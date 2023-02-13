import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/else/text_utils.dart';
import '../widgets/payment/delivery_container.dart';
import '../widgets/payment/payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: 'Shipping to',
              ),
              const SizedBox(
                height: 20,
              ),
              DeliveryContainer(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: 'Payment method',
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentMethod(),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: TextUtils(
                text: 'Total: 200\$',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              )),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {

                    },
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
