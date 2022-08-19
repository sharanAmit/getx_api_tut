import 'package:getx_api_tut/app/modules/home/product_model.dart';
import 'package:http/http.dart' as http;

class APiServices {
  static var client = http.Client();
  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(
      Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=colourpop"),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    return null;
  }
}
