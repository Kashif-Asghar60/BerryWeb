import 'package:berryweb/constants.dart';
import 'package:flutter/material.dart';

import '../../reuseableWidgets/hero_resuable.dart';

class MiddleHeroSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const MiddleHeroSection({
    Key? key,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReuseableHeroSection(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/01/01/21/56/cooking-5880136_1280.jpg',
      title: 'Handcrafted Rewards Program',
      subtitle:
          'Sign in to your Bramble Berry account to earn points and exclusive rewards every time you shop!',
      buttons: [
        HeroButton(
          label: 'Join now',
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            // Button action
          },
        ),
        HeroButton(
          label: 'Learn more',
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          onPressed: () {
            // Button action
          },
        ),
      ],
      height: 400,
      isMobile: isMobile,
      isTablet: isTablet,
    );
  }
}
