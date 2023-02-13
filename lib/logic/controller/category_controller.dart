import 'package:e_commerce/data/web_services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/products_model.dart';

class CategoryController extends GetxController {

  // Variables
  var categoryNameList = <String?>[].obs;
  var categoryList = <ProductModel?>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoriesLoading = false.obs;

  List<String> categoriesImages = [
    'https://i.ytimg.com/vi/jaFO-voIDHc/maxresdefault.jpg',
    'https://img.freepik.com/free-photo/ripple-ornament-forever-drop-costume_1232-3547.jpg?w=740&t=st=1674829545~exp=1674830145~hmac=5d821fd96253443594b09e273013755a1ebd81f92956978d7885bd8e0efaade0',
    'https://images.unsplash.com/photo-1426523038054-a260f3ef5bc9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1545&q=80',
    'https://media.istockphoto.com/id/1208148708/photo/polka-dot-summer-brown-dress-suede-wedge-sandals-eco-straw-tote-bag-cosmetics-on-a-light.jpg?s=612x612&w=0&k=20&c=9Y135GYKHLlPotGIfynBbMPhXNbYeuDuFzreL_nfDE8=',
  ];

  // Methods
  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
  void getCategories() async {
    var categoryName = await CategoryServices.getCategories();
    try {
       isCategoryLoading(true);
       if(categoryName!.isNotEmpty){
         categoryNameList.addAll(categoryName);
       }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategories(String categoriesName) async {
      isAllCategoriesLoading(true);
      categoryList.value = (await AllCategoryServices.getAllCategories(categoriesName))!;
      isAllCategoriesLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllNames = await getAllCategories(categoryNameList[index]!);

    if(categoryAllNames != null){
      categoryList.value = categoryAllNames;
    }
  }
}