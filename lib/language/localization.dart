import 'package:e_commerce/language/ar.dart';
import 'package:e_commerce/language/en.dart';
import 'package:e_commerce/language/fr.dart';
import 'package:e_commerce/language/sp.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import '../utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
      ene: en,
      ara: ar,
      fra: fr,
      spa: sp,
  };

}