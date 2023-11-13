import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.productModel, super.key});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, UpdateProductPage.id,
              arguments: productModel);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                height: 130,
                width: 220,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  )
                ]),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.title.substring(0, 6),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${productModel.price.toString()}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 100,
              bottom: 100,
              child: Image.network(
                productModel.image,
                height: 100,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
