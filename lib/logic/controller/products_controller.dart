import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/data/web_services/products_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {

  // Variables
  var productsList = <ProductModel?>[].obs;
  var favoritesList = <ProductModel?>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  // Search Variables
  var searchList = <ProductModel?>[].obs;
  TextEditingController searchController = TextEditingController();


  @override

  // Favorites Logic
  void onInit() {
    super.onInit();
    List ? storedShoppings = storage.read<List>('isFavouritesList');
    if(storedShoppings != null){
      favoritesList = storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
   var response = await  ProductsServices.getProducts();
   try {
     isLoading.value = true;
     if(response!.isNotEmpty){
       productsList.addAll(response);
     }
   } finally {
     isLoading.value = false;
   }
  }

  void manageFavorites(int productId) async {
    var existingIndex = favoritesList.indexWhere((element) => element!.id == productId);
    if(existingIndex >= 0){
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavouritesList');
    } else {
      favoritesList.add(productsList.firstWhere((element) => element!.id == productId));
      await storage.write('isFavouritesList', favoritesList);
    }
  }

  bool isFavorites(int productId){
    return favoritesList.any((element) => element!.id == productId);
  }

  // Search Bar Logic
  void addSearchToList(String searchUser){
    searchList.value = productsList.where((search) {
      var searchTitle = search!.title!.toLowerCase();
      var searchPrice = search.price!.toString().toLowerCase();
      return searchTitle.contains(searchUser.toLowerCase()) || searchPrice.toString().contains(searchUser.toLowerCase());
    }).toList();
    update();
  }

  void clearSearch(){
    searchController.clear();
    addSearchToList('');
  }

}