import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> jsonData =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(
        ProductModel.fromJson(jsonData[i]),
      );
    }
    return productsList;
  }
}
