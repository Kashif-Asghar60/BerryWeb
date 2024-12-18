import 'package:berryweb/constants.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const CategoriesGrid(
      {Key? key, required this.isMobile, required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Scents',
        'imageUrl':
            "https://media.istockphoto.com/id/2149954181/photo/three-luxury-perfume-bottles.jpg?s=1024x1024&w=is&k=20&c=gGl_M5UnAYcCVds3L8Fyi04iFoPtW6dVTdNGfNNGkWs="
      },
      {
        'name': 'Butters',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2018/05/18/12/55/butter-3411126_1280.jpg"
      },
      {
        'name': 'Oils',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg"
      },
      {
        'name': 'Colorants',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2020/03/10/04/45/holi-4917795_1280.jpg"
      },
      {
        'name': 'Molds',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2023/05/30/08/34/strawberry-8027947_1280.jpg"
      },
      {
        'name': 'Additives',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2018/08/16/22/01/cake-3611584_1280.jpg"
      },
      {
        'name': 'Bases',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2022/04/22/04/43/yellow-7148802_1280.jpg"
      },
      {
        'name': 'Kits',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2021/04/22/11/47/eye-shadows-6198839_1280.jpg"
      },
      {
        'name': 'Packaging',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2019/11/30/13/21/gift-4663231_1280.jpg"
      },
      {
        'name': 'Waxes',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2014/07/20/17/34/candle-397965_1280.jpg"
      },
      {
        'name': 'New Arrivals',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2019/06/28/20/42/questions-4304981_1280.jpg"
      },
      {
        'name': 'On Sale',
        'imageUrl':
            "https://cdn.pixabay.com/photo/2016/01/19/16/27/sale-1149344_1280.jpg"
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories",
              style: AppTextStyles.specialEliteText(isMobile, isTablet)),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile
                  ? 2 // 2 columns for mobile
                  : isTablet
                      ? 6 // 4 columns for tablet
                      : 6, // 6 columns for desktop
              crossAxisSpacing: isMobile || isTablet
                  ? 5
                  : 10, // Reduced spacing for mobile/tablet
              mainAxisSpacing:
                  isMobile ? 5 : 10, // Reduced spacing for mobile/tablet
              childAspectRatio:
                  isMobile ? 3 / 2 : 3 / 2, // Adjust for smaller screens
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryBox(
                isMobile: isMobile,
                isTablet: isTablet,
                imageUrl: category['imageUrl']!,
                name: category['name']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isMobile;
  final bool isTablet;

  const CategoryBox(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.isMobile,
      required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(name,
            textAlign: TextAlign.center,
            style: AppTextStyles.specialEliteTextMedium(isMobile, isTablet)),
      ],
    );
  }
}
