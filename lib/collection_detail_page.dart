import 'package:flutter/material.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionName;

  const CollectionDetailPage({super.key, required this.collectionName});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  String _getCollectionDescription(String collectionName) {
    switch (collectionName) {
      case 'Branded Merchandise':
        return 'Show your pride with our exclusive branded merchandise collection. '
            'From hoodies to hats, find the perfect way to rep your campus style.';
      case 'Stationery':
        return 'Stay organized with our premium stationery selection. '
            'Notebooks, pens, and planners perfect for students and professionals.';
      case 'Local Gifts':
        return 'Celebrate your local community with our curated local gifts. '
            'Unique items that showcase the best of our region.';
      case 'Apparel':
        return 'Comfortable and stylish apparel for every occasion. '
            'Quality clothing that works as hard as you do.';
      case 'Accessories':
        return 'Complete your look with our collection of trendy accessories. '
            'Bags, scarves, and more to express your personal style.';
      case 'Home & Living':
        return 'Transform your space with our home and living collection. '
            'Functional and beautiful items for your dorm or home.';
      default:
        return 'Browse our curated collection of premium products.';
    }
  }

  List<Map<String, String>> _getCollectionProducts(String collectionName) {
    switch (collectionName) {
      case 'Branded Merchandise':
        return [
          {
            'title': 'Campus Hoodie',
            'price': '£35.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'Branded Cap',
            'price': '£15.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Logo T-Shirt',
            'price': '£18.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
        ];
      case 'Stationery':
        return [
          {
            'title': 'Premium Notebook',
            'price': '£8.50',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Set of Pens',
            'price': '£6.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'Academic Planner',
            'price': '£12.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
        ];
      case 'Local Gifts':
        return [
          {
            'title': 'Local Ceramic Mug',
            'price': '£9.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'City Postcard Set',
            'price': '£5.50',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Local Art Print',
            'price': '£14.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
        ];
      case 'Apparel':
        return [
          {
            'title': 'Cotton T-Shirt',
            'price': '£16.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Joggers',
            'price': '£28.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'Crew Neck Sweatshirt',
            'price': '£32.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
        ];
      case 'Accessories':
        return [
          {
            'title': 'Canvas Backpack',
            'price': '£42.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'Wool Scarf',
            'price': '£18.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Phone Case',
            'price': '£12.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
        ];
      case 'Home & Living':
        return [
          {
            'title': 'Throw Pillow',
            'price': '£22.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
          {
            'title': 'Desk Lamp',
            'price': '£35.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          },
          {
            'title': 'Bed Throw',
            'price': '£40.00',
            'image':
                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final description = _getCollectionDescription(collectionName);
    final products = _getCollectionProducts(collectionName);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'PLACEHOLDER HEADER TEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                size: 18, color: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Collection Hero
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              color: Colors.grey[100],
              child: Column(
                children: [
                  Text(
                    collectionName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Products Grid
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 900 ? 3 : 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.75,
                  children: products
                      .map(
                        (product) => _ProductCard(
                          title: product['title']!,
                          price: product['price']!,
                          imageUrl: product['image']!,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'Continue Shopping',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Explore more collections and find exactly what you need.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/collections'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: Text('View All Collections'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 1,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '© ${DateTime.now().year} Union Shop. All rights reserved.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const _ProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/product'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.broken_image)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4d2963),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
