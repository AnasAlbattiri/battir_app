import 'package:e_commerce/view/screens/category_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import '../../view/screens/favorite_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final titles = [
    'Battir Shop',
    'Categories',
    'Favourites',
    'Settings',
  ].obs;

}