import 'package:flutter/material.dart';

class GridWithTextSection extends StatelessWidget {
  final bool isMobile, isTablet;

  const GridWithTextSection({
    Key? key,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            color: const Color(0xffF7F3EF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Text
                const Text(
                  "#BrambleOn",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Sub Text Lines
                const Text(
                  "We love the creative ways customers use our products!",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Here are a few favorites",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Responsive Grid Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Big Box (Image)
                    Expanded(
                      flex: 40,
                      child: Container(
                        height: isMobile
                            ? 150
                            : isTablet
                                ? 300
                                : 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2020/05/01/17/27/soap-5118210_1280.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Smaller Boxes (Images)
                    Expanded(
                      flex: 60,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              buildImageBox(
                                "https://cdn.pixabay.com/photo/2015/06/28/14/20/soap-bubble-824591_1280.jpg",
                              ),
                              buildImageBox(
                                "https://cdn.pixabay.com/photo/2016/07/11/15/45/soap-1509963_1280.jpg",
                              ),
                              buildImageBox(
                                "https://cdn.pixabay.com/photo/2015/03/14/13/56/soap-673176_1280.jpg",
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              buildImageBox(
                                  "https://cdn.pixabay.com/photo/2020/03/15/18/36/wash-4934590_1280.jpg"),
                              buildImageBox(
                                "https://cdn.pixabay.com/photo/2020/03/13/03/58/handmade-soap-4926841_1280.jpg",
                              ),
                              buildImageBox(
                                "https://cdn.pixabay.com/photo/2016/01/14/09/21/handmade-1139554_1280.jpg",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Instagram Label Positioned at Top-Right
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                print("Instagram link clicked");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Instagram",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.blue,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageBox(String imageUrl) {
    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
