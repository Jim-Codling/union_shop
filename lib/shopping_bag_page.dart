import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

// Dummy cart data for demonstration
final List<Map<String, dynamic>> cartItems = [];

class ShoppingBagPage extends StatelessWidget {
  const ShoppingBagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        double getTotalCost() {
          double total = 0.0;
          for (var item in cartItems) {
            total += (item['price'] as double) * (item['quantity'] as int);
          }
          return total;
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppHeader(),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shopping Bag',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      cartItems.isEmpty
                          ? const Text(
                              'Your shopping bag is empty.',
                              style: TextStyle(fontSize: 16),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 32),
                              itemBuilder: (context, index) {
                                final item = cartItems[index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        item['imageUrl']?.toString() ?? '',
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: 80,
                                            height: 80,
                                            color: Colors.grey[200],
                                            child:
                                                const Icon(Icons.broken_image),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title']?.toString() ?? '',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '£${item['price'].toString()}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF4d2963),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Text(
                                                  'Quantity: ${item['quantity']}'),
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  setState(() {
                                                    if (item['quantity'] > 1) {
                                                      item['quantity'] -= 1;
                                                    } else {
                                                      cartItems.removeAt(index);
                                                    }
                                                  });
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  setState(() {
                                                    item['quantity'] += 1;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          if (item.containsKey('size'))
                                            Text('Size: ${item['size']}'),
                                          if (item.containsKey('color'))
                                            Text('Colour: ${item['color']}'),
                                          if (item.containsKey('customText') &&
                                              item['customText'] is List)
                                            ...List.generate(
                                              (item['customText'] as List)
                                                  .length,
                                              (i) => Text(
                                                'Line ${i + 1}: ${(item['customText'] as List)[i]}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '£${getTotalCost().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4d2963),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Dummy checkout
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Checkout processed!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Checkout',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
