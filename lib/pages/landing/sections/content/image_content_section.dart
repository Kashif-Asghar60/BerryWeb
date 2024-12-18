import 'package:berryweb/constants.dart';
import 'package:flutter/material.dart';

class ImageContentSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const ImageContentSection({
    Key? key,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: AppColors.lightGreenbackground,
          child: isMobile
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Column(
                    // Display content vertically on mobile
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image Section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "https://media.istockphoto.com/id/1367672344/photo/an-african-american-single-mother-preparing-vegan-lunch-in-the-kitchen-and-smiling-with-her.jpg?s=1024x1024&w=is&k=20&c=xPXpiTafgWjoVdjsmFO7IEHCdqlsW_UH6AS0pTYu-3I=",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Content Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "A Community Built by Makers, for Makers.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "We're makers just like you, bringing together the best creative inspiration, expert guidance, and high-quality handcraft supplies. All in one place - to spark your imagination, fuel your creativity, and help you make the things you love. Join our community of passionate crafters, soap makers, and DIY enthusiasts.",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(
                                    0xFF546553), // Custom background color
                                foregroundColor: AppColors.white),
                            child: const Text("Learn More"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Row(
                    // Display content horizontally on larger screens
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image Section (Left)
                      Expanded(
                        flex: isTablet ? 6 : 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://media.istockphoto.com/id/1367672344/photo/an-african-american-single-mother-preparing-vegan-lunch-in-the-kitchen-and-smiling-with-her.jpg?s=1024x1024&w=is&k=20&c=xPXpiTafgWjoVdjsmFO7IEHCdqlsW_UH6AS0pTYu-3I=",
                            height: isTablet ? 250 : 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Content Section (Right)
                      Expanded(
                        flex: isTablet ? 5 : 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "A Community Built by Makers, for Makers.",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "We're makers just like you, bringing together the best creative inspiration, expert guidance, and high-quality handcraft supplies. All in one place - to spark your imagination, fuel your creativity, and help you make the things you love. Join our community of passionate crafters, soap makers, and DIY enthusiasts.",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(
                                    0xFF546553,
                                  ), // Custom background color
                                  foregroundColor: AppColors.white),
                              onPressed: () {},
                              child: const Text("Learn More"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
