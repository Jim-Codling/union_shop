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
      {'label': 'Sale', 'route': '/sale', 'color': Colors.red},
      {'label': 'About Us', 'route': '/about', 'color': Colors.grey},
    ];
    return isVertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var link in links)
                TextButton(
                  onPressed: () => _navigate(context, link['route'] as String),
                  style: TextButton.styleFrom(
                    foregroundColor: link['color'] as Color? ?? Colors.black,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(link['label'] as String),
                ),
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
                if (i != links.length - 1) const SizedBox(width: 16),
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
                    const Spacer(),
                    if (!isMobile)
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildNavLinks(context),
                            const Spacer(),
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
                              onPressed: () => Navigator.pushNamed(context, '/login'),
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
                              onPressed: _placeholderCallback,
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
                              onPressed: _placeholderCallback,
                            ),
                          ],
                        ),
                      )
                    else
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                _showMobileMenu = !_showMobileMenu;
                              });
                            },
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
