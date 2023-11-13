import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProductService({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> jsonData = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(jsonData);
  }
}
