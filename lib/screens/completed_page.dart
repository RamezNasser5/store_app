import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});
  static String id = "CompletedPage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/true-icon.jpg'),
              width: 150,
              height: 150,
            ),
            Text(
              'Update Product Completed',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
