import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';
import '../common.dart';

class StickyHeader extends StatefulWidget {
  final bool isMobile;

  final bool isTablet;
  final bool isDesktop;
  final Function onMenuToggle; // Function to call to show/hide panel

  const StickyHeader({
    Key? key,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.onMenuToggle,
  }) : super(key: key);

  @override
  _StickyHeaderState createState() => _StickyHeaderState();
}

class _StickyHeaderState extends State<StickyHeader> {
  @override
  Widget build(BuildContext context) {
    print(
        " Current mode is mobile? ${widget.isMobile} ,, Current mode is tablet? ${widget.isTablet} .. Current mode is desktop? ${widget.isDesktop}  ");
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.vertical,
        horizontal: AppPadding.horizontal,
      ),
      child: Row(
        children: [
          // Logo and Navigation
          Expanded(
            flex: widget.isTablet ? 0 : 3,
            child: Row(
              children: [
                // Logo
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 10),

                // Navigation Buttons (Hidden on mobile and grouped in a panel for tablet)
                if (!widget.isMobile && !widget.isTablet)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          NavButton(
                            text: "Shop by",
                            icon: Icons.shopping_bag,
                          ),
                          NavButton(text: "Sale"),
                          NavButton(text: "Seasonal"),
                          NavButton(text: "Projects & Resources"),
                          NavButton(text: "Get Started"),
                        ],
                      ),
                    ),
                  ),
                if (widget.isTablet)
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      widget.onMenuToggle(); // Call the passed function
                    },
                  ),
              ],
            ),
          ),

          // Search Bar, Sign In, and Cart Icon (Adjust for mobile and tablet)
          Expanded(
            flex: widget.isMobile || widget.isTablet ? 1 : 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Search Bar (Hidden or Reduced on mobile/tablet)
                if (!widget.isMobile)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.secondary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!widget.isMobile && !widget.isTablet)
                  const SizedBox(width: 10),

                // Sign In (Hidden or Adjusted on mobile/tablet)
                if (!widget.isMobile)
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person, color: AppColors.text),
                    label: const Text(
                      "Sign In",
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                const SizedBox(width: 10),

                // Cart Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart, color: AppColors.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
