import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/shopping_bag_page.dart';

class ProductPage extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final List<String>? colors;
  final List<String>? sizes;

  const ProductPage({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.colors,
    this.sizes,
  });

  // For navigation from other pages, you can use:
  // Navigator.pushNamed(context, '/product', arguments: {...});
  static ProductPage fromArguments(Map<String, dynamic> args) {
    return ProductPage(
      title: args['title'] ?? 'Product',
      price: args['price'] ?? '£0.00',
      imageUrl: args['imageUrl'] ?? '',
      description: args['description'] ?? '',
      colors: args['colors'] != null ? List<String>.from(args['colors']) : null,
      sizes: args['sizes'] != null ? List<String>.from(args['sizes']) : null,
    );
  }

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.colors != null && widget.colors!.isNotEmpty) {
      _selectedColor = widget.colors!.first;
    }
    if (widget.sizes != null && widget.sizes!.isNotEmpty) {
      _selectedSize = widget.sizes!.first;
    }
  }

  void _addToCart() {
    // Check if the item already exists in the cart with same options
    final existingIndex = cartItems.indexWhere((item) =>
        item['title'] == widget.title &&
        item['size'] == _selectedSize &&
        item['color'] == _selectedColor);
    if (existingIndex != -1) {
      cartItems[existingIndex]['quantity'] += _quantity;
    } else {
      cartItems.add({
        'title': widget.title,
        'price': double.tryParse(widget.price.replaceAll('£', '')) ?? 0.0,
        'quantity': _quantity,
        'size': _selectedSize,
        'color': _selectedColor,
        'imageUrl': widget.imageUrl,
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      Expanded(
                        flex: 2,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.broken_image, size: 48),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 32),
                      // Product Details
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.price,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Color(0xFF4d2963),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.description,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Quantity selector
                            Row(
                              children: [
                                const Text('Quantity:'),
                                const SizedBox(width: 8),
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
                            // Color selector
                            if (widget.colors != null &&
                                widget.colors!.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              const Text('Colour:'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                children: widget.colors!
                                    .map((color) => ChoiceChip(
                                          label: Text(color),
                                          selected: _selectedColor == color,
                                          onSelected: (_) => setState(
                                              () => _selectedColor = color),
                                        ))
                                    .toList(),
                              ),
                            ],
                            // Size selector
                            if (widget.sizes != null &&
                                widget.sizes!.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              const Text('Size:'),
                              const SizedBox(height: 8),
                              DropdownButton<String>(
                                value: _selectedSize,
                                items: widget.sizes!
                                    .map((size) => DropdownMenuItem(
                                          value: size,
                                          child: Text(size),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSize = value;
                                  });
                                },
                                isExpanded: false,
                                hint: const Text('Select size'),
                              ),
                            ],
                            const SizedBox(height: 32),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
