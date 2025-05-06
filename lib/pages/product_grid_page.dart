import 'package:flutter/material.dart';
import 'product_search_page.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  Color darkenColor(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/freshvegitables.png',
      'assets/cookingoilandghee.png',
      'assets/meatandfish.png',
      'assets/Bakery and snacks.jpg',
      'assets/Milk.jpg',
      'assets/Bevarges.png',
    ];

    final List<String> labels = [
      'Fresh Fruits & Vegetable',
      'Cooking Oil & Ghee',
      'Meat & Fish',
      'Bakery & Snacks',
      'Dairy & Eggs',
      'Beverages',
    ];

    final List<Color> boxColors = [
      Colors.green.shade50,
      Colors.orange.shade50,
      Colors.red.shade50,
      Colors.purple.shade50,
      Colors.yellow.shade50,
      Colors.blue.shade50,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Find Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Store',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: imagePaths.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final backgroundColor = boxColors[index];
                    final borderColor = darkenColor(backgroundColor, 0.08);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductSearchPage(categoryName: labels[index]),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: borderColor,
                            width: 1.2,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final imageSize = constraints.maxHeight * 0.5;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: imageSize,
                                  width: imageSize,
                                  child: Image.asset(
                                    imagePaths[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  labels[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
