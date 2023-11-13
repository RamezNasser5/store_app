import 'package:flutter/material.dart';
import 'package:store_app/Items/product_details.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_categury_service.dart';

class CustomFutureBuilderSearch extends StatelessWidget {
  const CustomFutureBuilderSearch({super.key, required this.categuryName});

  final String categuryName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<ProductModel>>(
        future: GetCategoryService().getCategory(categuryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductDetails(productModel: products[index]);
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
