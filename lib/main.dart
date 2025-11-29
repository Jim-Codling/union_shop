import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_us_page.dart';

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
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
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

  @override
  Widget build(BuildContext context) {
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
                  // Top banner
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
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
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
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Top link to the About page
                                TextButton(
                                  onPressed: () => navigateToAbout(context),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.grey,
                                  ),
                                  child: const Text('About Us'),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                      children: const [
                        ProductCard(
                          title: 'Placeholder Product 1',
                          price: '£10.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 2',
                          price: '£15.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 3',
                          price: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 4',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
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
                              onTap: placeholderCallbackForButtons,
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
                      Row(
                        children: [
                          Text(
                            'Made with ',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            size: 12,
                            color: Colors.red,
                          ),
                          Text(
                            ' by Union Shop',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
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
