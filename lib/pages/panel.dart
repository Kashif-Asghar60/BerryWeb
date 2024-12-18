import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onClose; // Callback to close the panel

  const PanelWidget({
    Key? key,
    required this.isVisible,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible)
      return const SizedBox.shrink(); // Return an empty widget if not visible

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 10,
        color: Colors.white
            .withOpacity(0.95), // Slight transparency for overlay effect
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Allow height to adjust to content
          children: [
            // Panel Header with Close Button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: onClose, // Call the close callback
                  ),
                ],
              ),
            ),

            // Panel Content with Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavButton(
                    text: "Shop by",
                    icon: Icons.shopping_bag,
                  ),
                  const SizedBox(height: 10),
                  NavButton(text: "Sale"),
                  const SizedBox(height: 10),
                  NavButton(text: "Seasonal"),
                  const SizedBox(height: 10),
                  NavButton(text: "Projects & Resources"),
                  const SizedBox(height: 10),
                  NavButton(text: "Get Started"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final IconData? icon;

  const NavButton({
    Key? key,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Navigation action or callback can be implemented here
      },
      icon: icon != null
          ? Icon(icon, color: Colors.black54)
          : const SizedBox.shrink(),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
