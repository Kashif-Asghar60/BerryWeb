import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.grey;
  static const Color text = Colors.black;
  static const Color white = Colors.white;
  static const Color green = Colors.green;
  static const Color secondaryText = Colors.grey;
  static const Color accent = Colors.amber;
  static const Color background = Colors.white;
  static const Color lightGreenbackground = Color(0xFFCFD6C4);
}

class AppPadding {
  static const double horizontal = 40.0;
  static const double vertical = 20.0;
}

class AppTextStyles {
  static TextStyle heading(bool isMobile, bool isTablet) {
    return GoogleFonts.specialElite(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 12.0
            : isTablet
                ? 14.0
                : 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle subHeading(bool isMobile, bool isTablet) {
    return GoogleFonts.specialElite(
      textStyle: TextStyle(
        color: AppColors.secondaryText,
        fontSize: isMobile
            ? 12.0
            : isTablet
                ? 14.0
                : 16.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  static TextStyle bodyText(bool isMobile, bool isTablet) {
    return GoogleFonts.specialElite(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 9.0
            : isTablet
                ? 10.0
                : 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle starRating() {
    return const TextStyle(
      fontSize: 14,
      color: AppColors.secondary,
    );
  }

  static TextStyle specialEliteText(bool isMobile, bool isTablet) {
    return GoogleFonts.specialElite(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 20.0
            : isTablet
                ? 22.0
                : 24.0, // Adjust font size
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle specialEliteTextMedium(bool isMobile, bool isTablet) {
    return GoogleFonts.specialElite(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 13.0
            : isTablet
                ? 15.0
                : 17.0, // Adjust font size
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle lobsterText(bool isMobile, bool isTablet) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 14.0
            : isTablet
                ? 16.0
                : 18.0, // Adjust font size
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle lobsterTextMedium(bool isMobile, bool isTablet) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: AppColors.text,
        fontSize: isMobile
            ? 10.0
            : isTablet
                ? 13.0
                : 15.0, // Adjust font size
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
