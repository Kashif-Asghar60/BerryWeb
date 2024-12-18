import 'package:flutter/material.dart';

import '../../../../constants.dart';

class HeroFeatureBox extends StatelessWidget {
  final String featureTitle;
  final String imageUrl;
  final bool isMobile;
  final bool isTablet;

  const HeroFeatureBox({
    Key? key,
    required this.featureTitle,
    required this.imageUrl,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isMobile || isTablet
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    featureTitle,
                    style: AppTextStyles.lobsterText(isMobile, isTablet),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      print("Learn More clicked for $featureTitle");
                    },
                    child: Text(
                      "Learn More",
                      style: AppTextStyles.lobsterTextMedium(isMobile, isTablet)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(featureTitle,
                            style:
                                AppTextStyles.lobsterText(isMobile, isTablet)),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            print("Learn More clicked for $featureTitle");
                          },
                          child: Text(
                            "Learn More",
                            style: AppTextStyles.lobsterTextMedium(
                                    isMobile, isTablet)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
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
