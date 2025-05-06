import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.yellow.shade700, width: 2),  // Yellow border
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                product['image'],
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  product['distance'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 5),
                Text(
                  'In Stock',  // You can replace this with stock info dynamically
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${product['price']}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product['discount'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 10),
                // Store Info with Location Icon
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      product['store'],
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Background color (updated)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
