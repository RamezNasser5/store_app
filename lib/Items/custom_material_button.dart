import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key, required this.updateProduct, this.onTap});

  final String updateProduct;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Make the button full-width
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Change button color to blue
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          updateProduct,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
