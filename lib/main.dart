import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_us_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/collection_detail_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/login_page.dart';
import 'dart:math';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // App routes
      routes: {
        '/product': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>? ??
              {};
          return ProductPage.fromArguments(args);
        },
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/sale': (context) => const SalePage(),
        '/collection-detail': (context) {
          final collectionName =
              ModalRoute.of(context)?.settings.arguments as String?;
          return CollectionDetailPage(collectionName: collectionName ?? '');
        },
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  // Example product list (replace with your actual product data source)
  List<Map<String, dynamic>> get allProducts => [
        {
          'title': 'Logo T-Shirt',
          'price': '£18.00',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'description':
              'Classic t-shirt with university logo. Comfortable for everyday wear.',
          'colors': ['White', 'Black', 'Navy'],
          'sizes': ['S', 'M', 'L', 'XL'],
        },
        {
          'title': 'Campus Hoodie',
          'price': '£35.00',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'description':
              'Warm and cozy hoodie with campus branding. Perfect for chilly days.',
          'colors': ['Grey', 'Black'],
          'sizes': ['S', 'M', 'L', 'XL'],
        },
        {
          'title': 'Premium Notebook',
          'price': '£8.50',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          'description': 'High-quality notebook for notes and ideas.',
        },
        {
          'title': 'Joggers',
          'price': '£28.00',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'description': 'Relaxed fit joggers for casual wear.',
          'colors': ['Black', 'Grey'],
          'sizes': ['S', 'M', 'L', 'XL'],
        },
        {
          'title': 'Crew Neck Sweatshirt',
          'price': '£32.00',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          'description': 'Classic crew neck sweatshirt with soft lining.',
          'colors': ['Blue', 'Grey'],
          'sizes': ['S', 'M', 'L', 'XL'],
        },
        {
          'title': 'Canvas Backpack',
          'price': '£42.00',
          'imageUrl':
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'description': 'Durable canvas backpack for books and essentials.',
        },
      ];

  List<Map<String, dynamic>> getRandomProducts(int count) {
    final products = List<Map<String, dynamic>>.from(allProducts);
    products.shuffle(Random());
    return products.take(count).toList();
  }

  @override
  Widget build(BuildContext context) {
    final randomProducts = getRandomProducts(4);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Placeholder Hero Title',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is placeholder text for the hero section.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: randomProducts.map((product) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/product',
                              arguments: product,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product['imageUrl']?.toString() ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),
                                  Text(
                                    product['title']?.toString() ?? '',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product['price']?.toString() ?? '',
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Column(
                children: [
                  // Footer content grid
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 800 ? 4 : 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 32,
                      children: [
                        // Column 1: About
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _FooterLink(
                              label: 'Our Story',
                              onTap: () => navigateToAbout(context),
                            ),
                            _FooterLink(
                              label: 'Mission & Values',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Team',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Careers',
                              onTap: placeholderCallbackForButtons,
                            ),
                          ],
                        ),
                        // Column 2: Shop
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _FooterLink(
                              label: 'All Products',
                              onTap: () => navigateToProduct(context),
                            ),
                            _FooterLink(
                              label: 'New Arrivals',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Best Sellers',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Sale',
                              onTap: () =>
                                  Navigator.pushNamed(context, '/sale'),
                            ),
                          ],
                        ),
                        // Column 3: Customer Service
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Customer Service',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _FooterLink(
                              label: 'Contact Us',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Shipping Info',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Returns',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'FAQ',
                              onTap: placeholderCallbackForButtons,
                            ),
                          ],
                        ),
                        // Column 4: Legal & Social
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Legal & Social',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _FooterLink(
                              label: 'Privacy Policy',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Terms of Service',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Follow Us',
                              onTap: placeholderCallbackForButtons,
                            ),
                            _FooterLink(
                              label: 'Newsletter',
                              onTap: placeholderCallbackForButtons,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // New text section: short blurb / contact info
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Union Shop is your campus store for branded merchandise, stationery and local gifts.'
                        'Have questions? Email us at support@unionshop.gmail.com or call (01234) 567-890.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SizedBox(height: 48),
                  // Footer divider
                  Container(
                    height: 1,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 24),
                  // Bottom footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© ${DateTime.now().year} Union Shop. All rights reserved.',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
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

// Footer link widget
class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
