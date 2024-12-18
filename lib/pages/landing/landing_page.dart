import 'package:berryweb/pages/landing/sections/hero/hero_section.dart';
import 'package:flutter/material.dart';
import '../panel.dart';
import 'sections/categories/categories_grid.dart';
import 'sections/categories/categories_section.dart';
import 'sections/content/grid_with_text_section.dart';
import 'sections/content/image_content_section.dart';
import 'sections/footer/footer.dart';
import 'sections/header/sticky_header.dart';
import 'sections/hero/hero_box_section.dart';
import 'sections/hero/hero_box_with_image.dart';
import 'sections/hero/middle_hero/middle_hero.dart';
import 'sections/projects/featured_projects_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isPanelVisible = false;

  void _togglePanel() {
    setState(() {
      _isPanelVisible = !_isPanelVisible;
    });
  }

  void _closePanel() {
    setState(() {
      _isPanelVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile =
                  constraints.maxWidth < 768; // Mobile: max width less than 768
              bool isTablet = constraints.maxWidth >= 768 &&
                  constraints.maxWidth < 1284; // Tablet: between 768 and 1284
              bool isDesktop =
                  constraints.maxWidth >= 1024; // Desktop: width 1284 or more

              return Column(
                children: [
                  // Sticky Header
                  StickyHeader(
                    isMobile: isMobile,
                    isTablet: isTablet,
                    isDesktop: isDesktop,
                    onMenuToggle: _togglePanel, // Pass the toggle function
                  ),

                  // Main Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            // Hero Section
                            HeroSection(
                              isMobile: isMobile,
                              isTablet: isTablet,
                            ),

                            // Categories Section (Carousel for Mobile, Grid for Desktop)
                            CategoriesSection(
                                isMobile: isMobile,
                                isTablet: isTablet), // Passing tablet mode

                            // Second Hero Image
                            MiddleHeroSection(
                              isMobile: isMobile,
                              isTablet: isTablet,
                            ),
                            // Categories Grid Section
                            CategoriesGrid(
                              isMobile: isMobile,
                              isTablet: isDesktop,
                            ), // Passing tablet mode

                            FeaturedProjectsSection(
                                isMobile: isMobile,
                                isTablet: isTablet), // Passing tablet mode
                            ImageContentSection(
                                isMobile: isMobile, isTablet: isTablet),
                            HeroBoxWithImage(
                                isMobile: isMobile, isTablet: isTablet),
                            // Passing tablet mode
                            // Passing tablet mode
                            // Featured Projects
                            // Hero Box Section
                            HeroBoxSection(
                                isMobile: isMobile,
                                isTablet: isTablet), // Passing tablet mode

                            GridWithTextSection(
                                isMobile: isMobile,
                                isTablet: isTablet), // Passing tablet mode
                            // Footer
                            Footer(
                                isMobile: isMobile,
                                isTablet: isTablet), // Passing tablet mode
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Panel Widget
          PanelWidget(
            isVisible: _isPanelVisible, // Control visibility
            onClose: _closePanel, // Pass the close function
          ),
        ],
      ),
    );
  }
}
