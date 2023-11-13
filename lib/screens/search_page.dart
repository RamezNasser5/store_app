import 'package:flutter/material.dart';
import 'package:store_app/Items/custom_future_builder_search.dart';
import 'package:store_app/Items/custom_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static String id = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? categuryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Page'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          children: [
            CustomTextField(
              productName: 'Search',
              onChange: (data) {
                categuryName = data;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            categuryName == null
                ? const Text('Entre your categury name')
                : CustomFutureBuilderSearch(
                    categuryName: categuryName!,
                  ),
          ],
        ),
      ),
    );
  }
}
