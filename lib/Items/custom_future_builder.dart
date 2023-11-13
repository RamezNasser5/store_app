import 'package:flutter/material.dart';
import 'package:store_app/Items/product_details.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: GetAllProductServices().getAllProducts(),
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
    );
  }
}
