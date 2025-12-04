import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppHeader(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About The Print Shack',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                Text(
                  'The Print Shack is your one-stop shop for personalised university merchandise! '
                  'We offer a wide range of custom printing services for students, staff, and societies. '
                  'From t-shirts and hoodies to mugs and tote bags, you can add your own text or design to make it truly unique.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  '🎉 New Feature: Custom Hoodie Personalisation!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963)),
                ),
                SizedBox(height: 8),
                Text(
                  'Order a hoodie with your own custom text printed on it. Choose your colour, size, and add your name, nickname, or society! '
                  'Perfect for gifts, events, or showing off your university pride.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  'Why choose The Print Shack?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '• High-quality printing and materials ensure your personalised items look and feel fantastic.\n'
                  '• Fast turnaround and friendly service from our expert team.\n'
                  '• Great for group orders, society events, or unique gifts.\n'
                  '• Support your university community by shopping local.\n'
                  '• Easy online ordering and in-store support for all your custom needs.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  'Visit us in-store or start your custom order online today! Experience the best in university personalisation with The Print Shack.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
