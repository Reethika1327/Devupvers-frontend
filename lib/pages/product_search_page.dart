
      import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class ProductSearchPage extends StatelessWidget {
  final String categoryName;

  ProductSearchPage({required this.categoryName});

  final List<String> recentSearches = ['Milk', 'Curd', 'Noodles', 'Horlicks'];
  final List<Map<String, dynamic>> products = List.generate(
    9,
    (index) => {
      'name': 'Red apple',
      'weight': '1kg',
      'price': 112,
      'oldPrice': 129,
      'discount': '13% off',
      'store': 'FreshMart Grocery',
      'distance': '700m away',
      'image': 'assets/apple.jpg', // Make sure this image path exists
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for "$categoryName"',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("Recent Search", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: recentSearches
                  .map((e) => Chip(
                        backgroundColor: Colors.white,
                        label: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 12),
            Text("Recommended products", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,  // 3 items per row
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
