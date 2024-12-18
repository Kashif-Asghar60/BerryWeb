import 'package:berryweb/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const CategoriesSection(
      {Key? key, required this.isMobile, required this.isTablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text("Choose Your Craft",
                style: AppTextStyles.specialEliteText(isMobile, isTablet)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: isMobile ? 350 : 450,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Displaying 10 images
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, index) => CategoryItem(
                width: isMobile ? 150 : 250,
                height: isMobile ? 300 : 350,
                font: isMobile ? 14 : 20,
                imageUrl:
                    "https://via.placeholder.com/150", // Replace with image URLs
                heading: _getHeading(index),
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
          )
        ],
      ),
    );
  }

  // A helper function to return the appropriate heading text based on the index
  String _getHeading(int index) {
    switch (index) {
      case 0:
        return "Candles";
      case 1:
        return "Skincare";
      case 2:
        return "Cold Process Soap";
      case 3:
        return "Mele Soap";
      case 4:
        return "Core Soap";
      case 5:
        return "Body Care";
      default:
        return "Craft ${index + 1}";
    }
  }
}

class CategoryItem extends StatefulWidget {
  final String imageUrl;
  final String heading;
  final double width, height;
  final double font;

  final bool isMobile;
  final bool isTablet;

  CategoryItem(
      {Key? key,
      required this.imageUrl,
      required this.heading,
      required this.width,
      required this.height,
      required this.font,
      required this.isMobile,
      required this.isTablet})
      : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    //   widget.imageUrl,
                    'https://images.unsplash.com/photo-1504674900247-0877df9cc836',

                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print("Error , $error ,,, stack $stackTrace");
                      return Center(
                        child: Icon(Icons.error, size: 50, color: Colors.red),
                      ); // Show an error icon or any fallback widget
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Visibility(
                      visible: _isHovered, // Button only visible when hovered
                      child: ElevatedButton(
                        onPressed: () {}, // Handle Explore button tap
                        child: Text(
                          "Explore",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(
                              219, 86, 18, 58), // White text color
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(widget.heading,
                textAlign: TextAlign.center,
                style: AppTextStyles.specialEliteText(
                    widget.isMobile, widget.isTablet)),
          ),
        ],
      ),
    );
  }
}
