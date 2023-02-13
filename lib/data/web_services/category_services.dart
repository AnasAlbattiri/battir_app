import 'package:e_commerce/utils/my_string.dart';
import 'package:http/http.dart' as http;
import '../model/category_model.dart';
import '../model/products_model.dart';

class CategoryServices {
  static Future<List<String?>?> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      throw Exception("Failed to get response");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModel?>?> getAllCategories(String categoriesNames) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoriesNames'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      throw Exception("Failed to get response");
    }
  }
}