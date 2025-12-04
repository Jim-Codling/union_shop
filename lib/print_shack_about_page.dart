// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppHeader(),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Union Print Shack',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        width: 220,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 220,
                            height: 220,
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image, size: 48),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Make It Yours at The Union Print Shack',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. '
                    'Swing by the shop - our team’s always happy to help you pick the right gear and answer any questions.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Uni Gear or Your Gear - We’ll Personalise It',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. '
                    'We can personalise official uni-branded clothing and your own items - just bring them in and let’s get creative!',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Simple Pricing, No Surprises',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Customising your gear won’t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. '
                    'Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Personalisation Terms & Conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We will print your clothing exactly as you have provided it to us, whether online or in person. '
                    'We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. '
                    'Refunds are not provided for any personalised items.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Ready to Make It Yours?\nPop in or get in touch today - let’s create something uniquely you with our personalisation service - The Union Print Shack!',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
