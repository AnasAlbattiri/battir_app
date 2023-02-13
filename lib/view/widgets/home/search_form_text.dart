import 'package:e_commerce/logic/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (_) {
      return TextField(
        onChanged: (searchUser) {
          controller.addSearchToList(searchUser);
        },
        controller: controller.searchController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchController.text.isNotEmpty ? IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ) : null,
          hintText: 'Search with name & price',
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }
}
