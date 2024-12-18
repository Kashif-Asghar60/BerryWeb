import 'package:flutter/material.dart';
import '../../../../constants.dart';

class FeaturedProjectBox extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int stars;
  final String description;
  final bool isMobile;
  final bool isTablet;

  const FeaturedProjectBox({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.stars,
    required this.description,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  String getStarRating() {
    return '★' * stars + '☆' * (5 - stars);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 250 : 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: isMobile ? 120 : 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.heading(isMobile, isTablet),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    getStarRating(),
                    style: AppTextStyles.starRating(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.bodyText(isMobile, isTablet),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
