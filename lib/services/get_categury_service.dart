// import 'package:store_app/helper/api.dart';
// import 'package:store_app/models/product_model.dart';

// class GetCateguryService {
//   Future<List<ProductModel>> getCategury(String categoryName) async {
//     List<ProductModel> jsonData = await Api()
//         // ignore: missing_required_param
//         .get(url: "https://fakestoreapi.com/products/category/$categoryName");

//     return jsonData;
//   }
// }

// ignore_for_file: avoid_print, missing_required_param

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategory(String categoryName) async {
    try {
      print(categoryName);
      List<dynamic> jsonData = await Api()
          .get(url: "https://fakestoreapi.com/products/category/$categoryName");

      List<ProductModel> products =
          jsonData.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    } catch (error) {
      print("Error: $error");
      return []; // Return an empty list or handle the error as needed.
    }
  }
}
