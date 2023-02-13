import 'package:e_commerce/logic/bindings/auth_binding.dart';
import 'package:e_commerce/logic/bindings/main_binding.dart';
import 'package:e_commerce/logic/bindings/products_binding.dart';
import 'package:e_commerce/view/screens/auth/forget_password_screen.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/main_screen.dart';
import 'package:e_commerce/view/screens/product_details_screen.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:e_commerce/view/screens/welcocme_screen.dart';
import 'package:e_commerce/view/widgets/category/category_widget.dart';
import 'package:e_commerce/view/widgets/else/cart_product_card.dart';
import 'package:e_commerce/view/widgets/else/cart_screen.dart';
import 'package:get/get.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/favorite_screen.dart';
import '../view/screens/payment_screen.dart';

class AppRoutes {
  static const welcome = '/welcome';
  static const main = '/main';

  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/forget_password',
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/main',
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBindings(),
        ProductsBindings(),
      ],
    ),
    GetPage(
      name: '/cart',
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductsBindings(),
      ],
    ),
    GetPage(
      name: '/category_widget',
      page: () => CategoryWidget(),
      bindings: [
        ProductsBindings(),
      ],
    ),
    GetPage(
      name: '/payment',
      page: () => PaymentScreen(),
      bindings: [
        AuthBinding(),
        MainBindings(),
        ProductsBindings(),
      ],
    ),

  ];


}
