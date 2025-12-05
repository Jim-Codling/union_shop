import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  void _placeholderCallback() {}

  bool _showMobileMenu = false;

  void _navigate(BuildContext context, String route) {
    setState(() {
      _showMobileMenu = false;
    });
    if (route == '/') {
      Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  Widget _buildNavLinks(BuildContext context, {bool isVertical = false}) {
    final links = [
      {'label': 'Home', 'route': '/'},
      {'label': 'Collections', 'route': '/collections'},
      // We'll insert Print Shack here
      {'label': 'Sale', 'route': '/sale', 'color': Colors.red},
      {'label': 'About Us', 'route': '/about', 'color': Colors.grey},
    ];
    return isVertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < links.length; i++) ...[
                TextButton(
                  onPressed: () =>
                      _navigate(context, links[i]['route'] as String),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        links[i]['color'] as Color? ?? Colors.black,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(links[i]['label'] as String),
                ),
                if (i == 1) // After Collections, insert Print Shack dropdown
                  PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text('The Print Shack',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ),
                    ),
                    onSelected: (value) {
                      if (value == 'about') {
                        Navigator.pushNamed(context, '/print-shack-about');
                      } else if (value == 'personalisation') {
                        Navigator.pushNamed(
                            context, '/print-shack-personalisation');
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'about',
                        child: Text('About'),
                      ),
                      const PopupMenuItem(
                        value: 'personalisation',
                        child: Text('Personalisation'),
                      ),
                    ],
                  ),
              ],
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < links.length; i++) ...[
                TextButton(
                  onPressed: () =>
                      _navigate(context, links[i]['route'] as String),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        links[i]['color'] as Color? ?? Colors.black,
                  ),
                  child: Text(links[i]['label'] as String),
                ),
                if (i == 1) // After Collections, insert Print Shack dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2), // Reduced padding
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text('The Print Shack',
                            style: TextStyle(color: Colors.black)),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        items: const [
                          DropdownMenuItem(
                            value: 'about',
                            child: Text('About'),
                          ),
                          DropdownMenuItem(
                            value: 'personalisation',
                            child: Text('Personalisation'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == 'about') {
                            Navigator.pushNamed(context, '/print-shack-about');
                          } else if (value == 'personalisation') {
                            Navigator.pushNamed(
                                context, '/print-shack-personalisation');
                          }
                        },
                      ),
                    ),
                  ),
                if (i != links.length - 1)
                  const SizedBox(width: 2), // Reduced spacing
              ],
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Material(
      elevation: 2,
      child: Container(
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
                'SHOP NOW FOR UNIVERSITY MERCHANDISE',
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
                    // Logo
                    GestureDetector(
                      onTap: () {
                        _navigate(context, '/');
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
                    // Center the nav links
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Calculate max width for nav links to avoid overflow
                          double maxNavWidth = constraints.maxWidth > 500
                              ? 500
                              : constraints.maxWidth - 32;
                          return Center(
                            child: SizedBox(
                              width: maxNavWidth,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (!isMobile) _buildNavLinks(context),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Action icons
                    if (!isMobile)
                      Row(
                        children: [
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
                            onPressed: _placeholderCallback,
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/login'),
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/shopping-bag'),
                          ),
                          PopupMenuButton(
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
                            onSelected: (value) {
                              if (value == 'printshack_about') {
                                Navigator.pushNamed(
                                    context, '/print-shack-about');
                              } else if (value ==
                                  'printshack_personalisation') {
                                Navigator.pushNamed(
                                    context, '/print-shack-personalisation');
                              } else {
                                _navigate(context, value as String);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: '/',
                                child: Text('Home'),
                              ),
                              const PopupMenuItem(
                                value: '/collections',
                                child: Text('Collections'),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_header',
                                enabled: false,
                                child: Text(
                                  'The Print Shack',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_about',
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text('About'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_personalisation',
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text('Personalisation'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: '/sale',
                                child: Text('Sale'),
                              ),
                              const PopupMenuItem(
                                value: '/about',
                                child: Text('About Us'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (isMobile)
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.menu, color: Colors.grey),
                            onSelected: (value) {
                              if (value == 'printshack_about') {
                                Navigator.pushNamed(
                                    context, '/print-shack-about');
                              } else if (value ==
                                  'printshack_personalisation') {
                                Navigator.pushNamed(
                                    context, '/print-shack-personalisation');
                              } else {
                                _navigate(context, value);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: '/',
                                child: Text('Home'),
                              ),
                              const PopupMenuItem(
                                value: '/collections',
                                child: Text('Collections'),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_header',
                                enabled: false,
                                child: Text(
                                  'The Print Shack',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_about',
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text('About'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'printshack_personalisation',
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text('Personalisation'),
                                ),
                              ),
                              const PopupMenuItem(
                                value: '/sale',
                                child: Text('Sale'),
                              ),
                              const PopupMenuItem(
                                value: '/about',
                                child: Text('About Us'),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            if (isMobile && _showMobileMenu)
              Container(
                width: double.infinity,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  child: _buildNavLinks(context, isVertical: true),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
