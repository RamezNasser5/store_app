import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      //id: jsonData['id'],
      id: int.parse(jsonData['id'].toString()),
      title: jsonData['title'],
      //price: jsonData['price'],
      price: double.parse(jsonData['price'].toString()),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      ratingModel: RatingModel.fromJson(jsonData['rating']),
    );
  }
}
