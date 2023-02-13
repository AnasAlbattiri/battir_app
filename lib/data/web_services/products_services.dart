import 'package:e_commerce/utils/my_string.dart';
import 'package:http/http.dart' as http;
import '../model/products_model.dart';


class ProductsServices {
  static Future<List<ProductModel?>?> getProducts() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      throw Exception("Failed to get response");
    }
  }
}