import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/models/product.dart'; // Import your product model

class CollectionDetailPage extends StatefulWidget {
  final String collectionName;

  const CollectionDetailPage({super.key, required this.collectionName});

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  // single sort option control:
  // values: 'none' | 'price_asc' | 'price_desc' | 'alpha_asc' | 'alpha_desc'
  String _sortOption = 'none';

  // filter controls
  // values: 'all' | 'under_10' | '10_20' | '20_30' | 'over_30'
  String _filterOption = 'all';
  String _searchQuery = '';

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

  // Map collection names to product lists from allProducts
  List<Product> _getCollectionProducts(String collectionName) {
    switch (collectionName) {
      case 'Branded Merchandise':
        return allProducts
            .where((p) =>
                p.title == 'Campus Hoodie' ||
                p.title == 'Branded Cap' ||
                p.title == 'Logo T-Shirt')
            .toList();
      case 'Stationery':
        return allProducts
            .where((p) =>
                p.title == 'Premium Notebook' ||
                p.title == 'Set of Pens' ||
                p.title == 'Academic Planner')
            .toList();
      case 'Local Gifts':
        return allProducts
            .where((p) =>
                p.title == 'Local Ceramic Mug' ||
                p.title == 'City Postcard Set' ||
                p.title == 'Local Art Print')
            .toList();
      case 'Apparel':
        return allProducts
            .where((p) =>
                p.title == 'Cotton T-Shirt' ||
                p.title == 'Joggers' ||
                p.title == 'Crew Neck Sweatshirt')
            .toList();
      case 'Accessories':
        return allProducts
            .where((p) =>
                p.title == 'Canvas Backpack' ||
                p.title == 'Wool Scarf' ||
                p.title == 'Phone Case')
            .toList();
      case 'Home & Living':
        return allProducts
            .where((p) =>
                p.title == 'Throw Pillow' ||
                p.title == 'Desk Lamp' ||
                p.title == 'Bed Throw')
            .toList();
      default:
        return [];
    }
  }

  double _priceFromString(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  List<Product> _sortedProducts(String collectionName) {
    final products = List<Product>.from(_getCollectionProducts(collectionName));

    switch (_sortOption) {
      case 'price_asc':
        products.sort((a, b) =>
            _priceFromString(a.price).compareTo(_priceFromString(b.price)));
        break;
      case 'price_desc':
        products.sort((a, b) =>
            _priceFromString(b.price).compareTo(_priceFromString(a.price)));
        break;
      case 'alpha_asc':
        products.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case 'alpha_desc':
        products.sort(
            (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      case 'none':
      default:
        // leave original order
        break;
    }

    return products;
  }

  // new: apply filter and search to a product list
  List<Product> _applyFilters(List<Product> products) {
    final query = _searchQuery.trim().toLowerCase();
    return products.where((p) {
      final price = _priceFromString(p.price);
      // filter by selected price range
      switch (_filterOption) {
        case 'under_10':
          if (!(price < 10.0)) return false;
          break;
        case '10_20':
          if (!(price >= 10.0 && price < 20.0)) return false;
          break;
        case '20_30':
          if (!(price >= 20.0 && price < 30.0)) return false;
          break;
        case 'over_30':
          if (!(price >= 30.0)) return false;
          break;
        case 'all':
        default:
          break;
      }
      // search by title
      if (query.isNotEmpty && !p.title.toLowerCase().contains(query)) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final collectionName = widget.collectionName;
    final description = _getCollectionDescription(collectionName);
    final sorted = _sortedProducts(collectionName);
    final products = _applyFilters(sorted);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            // Back button only
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, size: 18, color: Colors.grey),
                onPressed: () => Navigator.pop(context),
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
                  const SizedBox(height: 16),
                  // Controls: sort + filter + search
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Sort: '),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: _sortOption,
                              items: const [
                                DropdownMenuItem(
                                    value: 'none', child: Text('None')),
                                DropdownMenuItem(
                                    value: 'price_asc',
                                    child: Text('Price, Ascending')),
                                DropdownMenuItem(
                                    value: 'price_desc',
                                    child: Text('Price, Descending')),
                                DropdownMenuItem(
                                    value: 'alpha_asc',
                                    child: Text('Alphabetical, A → Z')),
                                DropdownMenuItem(
                                    value: 'alpha_desc',
                                    child: Text('Alphabetical, Z → A')),
                              ],
                              onChanged: (v) =>
                                  setState(() => _sortOption = v ?? 'none'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Filter: '),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: _filterOption,
                              items: const [
                                DropdownMenuItem(
                                    value: 'all', child: Text('All')),
                                DropdownMenuItem(
                                    value: 'under_10',
                                    child: Text('Under £10')),
                                DropdownMenuItem(
                                    value: '10_20', child: Text('£10 - £20')),
                                DropdownMenuItem(
                                    value: '20_30', child: Text('£20 - £30')),
                                DropdownMenuItem(
                                    value: 'over_30', child: Text('Over £30')),
                              ],
                              onChanged: (v) =>
                                  setState(() => _filterOption = v ?? 'all'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 220,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search items',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              isDense: true,
                            ),
                            onChanged: (v) => setState(() => _searchQuery = v),
                          ),
                        ),
                      ],
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
                child: products.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Text(
                            'No items match your filters.',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      )
                    : GridView.count(
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
                                title: product.title,
                                price: product.price,
                                imageUrl: product.imageUrl,
                                clothes: product.clothes,
                                description: product.description,
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
  final bool clothes;
  final String description;

  const _ProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.clothes,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: () {
          if (clothes == true) {
            Navigator.pushNamed(
              context,
              '/product',
              arguments: {
                'title': title,
                'price': price,
                'imageUrl': imageUrl,
                'description': description,
                'colors': ['White', 'Black', 'Navy'],
                'sizes': ['S', 'M', 'L', 'XL'],
              },
            );
          } else {
            Navigator.pushNamed(context, '/product', arguments: {
              'title': title,
              'price': price,
              'imageUrl': imageUrl,
              'description': description,
            });
          }
        },
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
