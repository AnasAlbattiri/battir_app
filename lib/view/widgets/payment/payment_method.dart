import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/else/text_utils.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int radioContainerIndex = 1;
  bool changeColors = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildRadioPayment(
            value: 1,
            name: 'Paypal',
            image: 'assets/images/paypal.png',
            scale: 0.7,
            onChange: (int? value){
              setState(() {
                radioContainerIndex = value!;
                changeColors = !changeColors;

              });
            }
          ),
          SizedBox(height: 15,),
          buildRadioPayment(
              value: 2,
              name: 'Google Pay',
              image: 'assets/images/google.png',
              scale: 0.8,
              onChange: (int? value){
                setState(() {
                  radioContainerIndex = value!;
                  changeColors = !changeColors;

                });
              }
          ),
          SizedBox(height: 15,),
          buildRadioPayment(
              value: 3,
              name: 'Credit Card',
              image: 'assets/images/credit.png',
              scale: 0.7,
              onChange: (int? value){
                setState(() {
                  radioContainerIndex = value!;
                  changeColors = !changeColors;

                });
              }
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required String name,
    required double scale,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                text: name,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => mainColor,),
          ),
        ],
      ),
    );
  }
}
