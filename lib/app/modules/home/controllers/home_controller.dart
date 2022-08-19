import 'package:get/get.dart';
import 'package:getx_api_tut/app/modules/apimodule/api_services.dart';
import 'package:getx_api_tut/app/modules/home/product_model.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await APiServices.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
