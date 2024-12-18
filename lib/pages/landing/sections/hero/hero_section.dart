import 'package:flutter/material.dart';

import 'hero_image.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const HeroSection({
    Key? key,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = isMobile
        ? 250
        : isTablet
            ? 400
            : 500; // Dynamic height based on device type
    return SizedBox(
      height: height,
      child: PageView(
        children: const [
          HeroImage(
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1670601440146-3b33dfcd7e17?q=80&w=2738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            caption: 'Artisan Bakery',
          ),
          HeroImage(
            imageUrl:
                'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
            caption: 'Delicious Cuisine',
          ),
          HeroImage(
            imageUrl:
                'https://media.istockphoto.com/id/807420150/photo/food-palette-concept.jpg?s=1024x1024&w=is&k=20&c=Qc25l1CMwkn0HJI8ilFkDj4mvXPh_S8wfXf8k4m5nNc=',
            caption: 'Handcrafted Pottery',
          ),
        ],
      ),
    );
  }
}
