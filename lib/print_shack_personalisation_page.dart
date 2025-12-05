import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/shopping_bag_page.dart';
import 'package:union_shop/models/product.dart'; // Import the product model

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

  Product get hoodie => allProducts.firstWhere(
        (p) => p.title == 'Custom Print Shack Hoodie',
      );

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addToCart() {
    final lines = _controllers.take(_numLines).map((c) => c.text).toList();
    // Convert price string (e.g. "£40.00") to double
    final priceValue = double.tryParse(
          hoodie.price.replaceAll(RegExp(r'[^\d.]'), ''),
        ) ??
        0.0;
    cartItems.add({
      'title': hoodie.title,
      'price': priceValue,
      'quantity': _quantity,
      'customText': lines,
      'imageUrl': hoodie.imageUrl,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Custom hoodie added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
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
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  hoodie.imageUrl,
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 180,
                                      height: 180,
                                      color: Colors.grey[200],
                                      child: const Icon(Icons.broken_image,
                                          size: 48),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              hoodie.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              hoodie.description,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              hoodie.price,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4d2963),
                                fontWeight: FontWeight.bold,
                              ),
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
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                hoodie.imageUrl,
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 180,
                                    height: 180,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.broken_image,
                                        size: 48),
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
                                    hoodie.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    hoodie.description,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    hoodie.price,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF4d2963),
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
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
                                        onPressed: () =>
                                            setState(() => _quantity++),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _addToCart,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF4d2963),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
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
