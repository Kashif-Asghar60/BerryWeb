import 'package:flutter/material.dart';

import '../reuseableWidgets/hero_resuable.dart';

class HeroBoxWithImage extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  const HeroBoxWithImage(
      {Key? key, required this.isMobile, required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReuseableHeroSection(
      imageUrl:
          'https://images.unsplash.com/photo-1676852148076-7a92002419f3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fEhvbWVvcGF0aGljfGVufDB8fDB8fHww',
      title:
          'Get started with quality ingredients, inspired by your creativity',
      subtitle: '',
      buttons: [
        HeroButton(
          label: 'Get Started',
          backgroundColor: Color(0xFF546553),
          foregroundColor: Colors.white,
          onPressed: () {
            // Button action
          },
        ),
        HeroButton(
          label: 'Choose Project',
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF546553),
          onPressed: () {
            // Button action
          },
        ),
      ],
      height: 300,
      isMobile: isMobile,
      isTablet: isTablet,
    );
  }
}
