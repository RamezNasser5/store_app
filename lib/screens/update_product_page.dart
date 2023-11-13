import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Items/custom_material_button.dart';
import 'package:store_app/Items/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/completed_page.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  double? price;

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white, // Use a white background
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                productName: 'Product Name',
                onChange: (data) {
                  productName = data;
                },
              ),
              CustomTextField(
                productName: 'Description',
                onChange: (data) {
                  description = data;
                },
              ),
              CustomTextField(
                textInputType: TextInputType.number,
                productName: 'Price',
                onChange: (data) {
                  price = double.parse(data);
                },
              ),
              CustomTextField(
                productName: 'Image',
                onChange: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                  height: 20), // Add some spacing between fields and button
              CustomMaterialButton(
                onTap: () async {
                  isLoaded = true;
                  setState(() {});
                  Navigator.pushNamed(context, CompletedPage.id);

                  try {
                    await updateProduct(productModel);
                  } catch (e) {
                    throw (e.toString());
                  }
                  isLoaded = false;
                  setState(() {});
                },
                updateProduct: 'Update Product',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProductService(
      id: productModel.id,
      title: productName == null ? productModel.title : productName!,
      price: price == null ? productModel.price : price!,
      description:
          description == null ? productModel.description : description!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
