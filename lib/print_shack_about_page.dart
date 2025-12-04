import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child:
                Text('About The Print Shack', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
