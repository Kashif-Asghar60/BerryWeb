import 'package:flutter/material.dart';

class ReuseableHeroSection extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final List<HeroButton> buttons;
  final double height;
  final bool isMobile;
  final bool isTablet;

  const ReuseableHeroSection({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttons,
    required this.height,
    required this.isMobile,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Radius for all sides
      child: Container(
        width: double.infinity,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),

            // Overlay gradient for text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // Content overlay
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20
                      : isTablet
                          ? 40
                          : 60,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile
                            ? 20
                            : isTablet
                                ? 28
                                : 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile
                            ? 14
                            : isTablet
                                ? 16
                                : 18,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buttons.map((button) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            onPressed: button.onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: button.backgroundColor,
                              foregroundColor: button.foregroundColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 15 : 25,
                                vertical: isMobile ? 10 : 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              button.label,
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroButton {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  HeroButton({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });
}
