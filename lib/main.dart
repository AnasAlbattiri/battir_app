import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'language/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Battir Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocalizationApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ? AppRoutes.main : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
