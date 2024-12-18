import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'projects_box.dart';

class FeaturedProjectsSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const FeaturedProjectsSection({
    Key? key,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);
  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Frosted Fir Layered Candle Project',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1701094772100-b1988ac13707?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'stars': 5,
      'description':
          'Create beautiful layered candles with a frosted fir scent.eate beautiful layered candles with a frosted fir scenteate beautiful layered candles with a frosted fir scenteate beautiful layered candles with a frosted fir scent'
    },
    {
      'title': 'Lingonberry Bath Bombs Project',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1673518901206-afbe181afabd?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TGluZ29uYmVycnklMjBCYXRoJTIwQm9tYnN8ZW58MHx8MHx8fDA%3D',
      'stars': 4,
      'description':
          'Make soothing bath bombs infused with lingonberry fragrance.'
    },
    {
      'title': 'Lump of Coal Soap Project',
      'imageUrl':
          'https://images.unsplash.com/photo-1474625121024-7595bfbc57ac?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fEx1bXAlMjBvZiUyMENvYWwlMjBTb2FwfGVufDB8fDB8fHww',
      'stars': 3,
      'description': 'Craft unique charcoal soap bars resembling lumps of coal.'
    },
    {
      'title': 'Candy Cane Soap Project',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1673247640411-90852b2dfadc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2FuZHklMjBDYW5lJTIwU29hcHxlbnwwfHwwfHx8MA%3D%3D',
      'stars': 4,
      'description':
          'Design festive soap bars with a refreshing candy cane aroma.'
    },
    {
      'title': 'Gingerbread Man Soap Project',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1664205766128-b15c317ae028?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8R2luZ2VyYnJlYWQlMjBNYW4lMjBTb2FwfGVufDB8fDB8fHww',
      'stars': 5,
      'description': 'Mold adorable soap bars in the shape of gingerbread men.'
    },
    {
      'title': 'Lavender Candle Jars Project',
      'imageUrl':
          'https://media.istockphoto.com/id/1307791121/photo/hygiene-and-skin-care-product-samples-with-lavender-flowers-on-wooden-soap-shampoo-lavender.jpg?s=1024x1024&w=is&k=20&c=Ph9P57kl6W2mE7PePE2h3hjz1J9EAFpB0JAFJFwO_as=',
      'stars': 5,
      'description': 'Create calming lavender candles in decorative glass jars.'
    },
    {
      'title': 'Rustic Wooden Centerpiece Project',
      'imageUrl':
          'https://images.unsplash.com/photo-1508716713574-8b04d73548ac?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fFJ1c3RpYyUyMFdvb2RlfGVufDB8fDB8fHww',
      'stars': 4,
      'description': 'Build rustic centerpieces perfect for holiday tables.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Projects",
            style: AppTextStyles.specialEliteText(isMobile, isTablet),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: isMobile ? 270 : 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, index) {
                final project = projects[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: FeaturedProjectBox(
                    title: project['title'],
                    imageUrl: project['imageUrl'],
                    stars: project['stars'],
                    description: project['description'],
                    isMobile: isMobile,
                    isTablet: isTablet,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
