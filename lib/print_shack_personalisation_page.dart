import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/shopping_bag_page.dart';

class PrintShackPersonalisationPage extends StatefulWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  State<PrintShackPersonalisationPage> createState() =>
      _PrintShackPersonalisationPageState();
}

class _PrintShackPersonalisationPageState
    extends State<PrintShackPersonalisationPage> {
  int _numLines = 1;
  int _quantity = 1;
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addToCart() {
    final lines = _controllers.take(_numLines).map((c) => c.text).toList();
    cartItems.add({
      'title': 'Custom Print Shack Hoodie',
      'price': 40.00,
      'quantity': _quantity,
      'customText': lines,
      'imageUrl':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Custom hoodie added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Print Shack Personalisation',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 180,
                              height: 180,
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
                            const Text(
                              'Custom Hoodie',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Create your own personalised hoodie! Choose up to 4 lines of custom text to be printed on your hoodie. Perfect for gifts, societies, or showing your unique style.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Text('Number of lines:'),
                                const SizedBox(width: 12),
                                DropdownButton<int>(
                                  value: _numLines,
                                  items: List.generate(4, (i) => i + 1)
                                      .map((n) => DropdownMenuItem(
                                            value: n,
                                            child: Text('$n'),
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(() {
                                        _numLines = val;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            for (int i = 0; i < _numLines; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: TextField(
                                  controller: _controllers[i],
                                  decoration: InputDecoration(
                                    labelText: 'Line ${i + 1} text',
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                  ),
                                  maxLength: 24,
                                ),
                              ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Quantity:'),
                                const SizedBox(width: 12),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: _quantity > 1
                                      ? () => setState(() => _quantity--)
                                      : null,
                                ),
                                Text('$_quantity'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => setState(() => _quantity++),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _addToCart,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
