import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/app_header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final results = allProducts
        .where((p) => p.title.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search products',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  _query = val;
                });
              },
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Center(child: Text('No products found.'))
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, idx) {
                      final product = results[idx];
                      return ListTile(
                        leading: Image.network(
                          product.imageUrl,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                        title: Text(product.title),
                        subtitle: Text(product.price),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/product',
                            arguments: {
                              'title': product.title,
                              'price': product.price,
                              'imageUrl': product.imageUrl,
                              'description': product.description,
                              'colors': product.colors,
                              'sizes': product.sizes,
                              'clothes': product.clothes,
                              'url': product.url,
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
