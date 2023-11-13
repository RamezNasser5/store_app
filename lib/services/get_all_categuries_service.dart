import 'package:store_app/helper/api.dart';

class GetAllCateguriesService {
  Future<List<dynamic>> getAllCateguries() async {
    List<dynamic> jsonData =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return jsonData;
  }
}
