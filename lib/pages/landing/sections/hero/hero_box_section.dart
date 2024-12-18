import 'package:flutter/material.dart';
import 'hero_feature_box.dart';

class HeroBoxSection extends StatelessWidget {
  final bool isMobile, isTablet;

  const HeroBoxSection(
      {Key? key, required this.isMobile, required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Built by makers, for makers since 1999:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeroFeatureBox(
                featureTitle: "High quality, ethically sourced",
                imageUrl:
                    "https://cdn.pixabay.com/photo/2020/02/08/10/35/soap-4829708_1280.jpg",
                isMobile: isMobile,
                isTablet: isTablet,
              ),
              HeroFeatureBox(
                featureTitle: "Hand-formulated and tested",
                imageUrl:
                    "https://cdn.pixabay.com/photo/2018/02/01/15/53/soap-3123468_1280.jpg",
                isMobile: isMobile,
                isTablet: isTablet,
              ),
              HeroFeatureBox(
                featureTitle: "Inspired by your creativity",
                imageUrl:
                    "https://cdn.pixabay.com/photo/2020/05/08/10/22/soap-5145054_1280.jpg",
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
