import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/shopping_bag_page.dart';

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  void _addToCart() {
    // Convert price string (e.g. "£22.00") to double
    final priceValue = double.tryParse(
          widget.price.replaceAll(RegExp(r'[^\d.]'), ''),
        ) ??
        0.0;
    cartItems.add({
      'title': widget.title,
      'price': priceValue,
      'quantity': _quantity,
      'imageUrl': widget.imageUrl,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppHeader(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.imageUrl,
                      width: 260,
                      height: 260,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 260,
                          height: 260,
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, size: 48),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.price,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4d2963),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Text('Quantity:',
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 12),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: _quantity > 1
                                  ? () => setState(() => _quantity--)
                                  : null,
                            ),
                            Text('$_quantity',
                                style: const TextStyle(fontSize: 16)),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => setState(() => _quantity++),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _addToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
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
