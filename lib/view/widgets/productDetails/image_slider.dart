import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/view/widgets/productDetails/colors_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/theme.dart';
import 'package:flutter/src/material/badge.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;

  ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

// Variables
final cartController = Get.find<CartController>();
CarouselController carouselController = CarouselController();
final List<Color> colorSelected = [
  kCOlor1,
  kCOlor2,
  kCOlor3,
  kCOlor4,
  kCOlor3,
  kCOlor5,
  kCOlor2,
  kCOlor4,
];
int currentPage = 0;
int currentColor = 0;

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(
              seconds: 3,
            ),
            enlargeCenterPage: true,
            onPageChanged: (index, reson) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: Get.isDarkMode ? Colors.black : Colors.grey,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorsPicker(
                        outerBorder: currentColor == index,
                        color: colorSelected[index],
                      ));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 3,
                  );
                },
                itemCount: colorSelected.length),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                ),
              ),
              Obx(() {
                return badge.Badge(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/cart');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                  position: BadgePosition.topEnd(top: -10, end: -10),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
