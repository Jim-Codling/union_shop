import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class PrintShackPersonalisationPage extends StatelessWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Text('Print Shack Personalisation',
                style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
