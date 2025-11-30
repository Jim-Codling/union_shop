import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale'),
        backgroundColor: const Color(0xFF4d2963),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => navigateToHome(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sale hero
            Container(
              width: double.infinity,
              color: Colors.purple[700],
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              child: const Column(
                children: [
                  Text(
                    'Seasonal Sale',
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Limited time deals — save on selected items across the store!',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Sale description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const Text(
                  'Browse discounted items below. Prices shown are the sale prices. '
                  'Click any item to view product details.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
                ),
              ),
            ),

            // Sale items grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.78,
                  children: [
                    _SaleItemCard(
                      title: 'Union Hoodie — Sale',
                      price: '£22.00',
                      imageUrl:
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      onTap: () => navigateToProduct(context),
                    ),
                    _SaleItemCard(
                      title: 'Campus Mug — Sale',
                      price: '£7.50',
                      imageUrl:
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                      onTap: () => navigateToProduct(context),
                    ),
                    _SaleItemCard(
                      title: 'Notebook Pack — Sale',
                      price: '£5.00',
                      imageUrl:
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                      onTap: () => navigateToProduct(context),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
            // Small CTA
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                child: Text('Back to Home'),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _SaleItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const _SaleItemCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text(price, style: const TextStyle(fontSize: 13, color: Colors.deepPurple)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}