import 'package:e_commerce/view/widgets/else/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/products_model.dart';
import '../widgets/productDetails/add_cart.dart';
import '../widgets/productDetails/clothes_info.dart';
import '../widgets/productDetails/image_slider.dart';
import '../widgets/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productModel,}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                imageUrl: productModel.image!,
              ),
              ClothesInfo(
                title: productModel.title!,
                productId: productModel.id!,
                rate: productModel.rating!,
                description: productModel.description!,
              ),
              SizeList(),
              AddCart(
                price: productModel.price!,
                productModel: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
