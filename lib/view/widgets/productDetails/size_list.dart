import 'package:e_commerce/view/widgets/productDetails/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class SizeList extends StatefulWidget {
  SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Get.isDarkMode ? currentSelected == index ? pinkClr.withOpacity(0.4) : Colors.black
                    : currentSelected == index ? mainColor.withOpacity(0.4) : Colors.white,
                border: Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                  color: Get.isDarkMode
                      ? currentSelected == index
                          ? Colors.white
                          : Colors.white
                      : currentSelected == index
                          ? Colors.black
                          : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: sizeList.length,
      ),
    );
  }
}
