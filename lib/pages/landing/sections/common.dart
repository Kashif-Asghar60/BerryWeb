import 'package:flutter/material.dart';

import '../../../constants.dart';

class PlaceholderWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;

  const PlaceholderWidget({
    Key? key,
    this.width,
    this.height,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 100,
      color: color,
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final IconData? icon;

  const NavButton({Key? key, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.black.withOpacity(0.1), // Hover effect
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.text, size: 16),
                const SizedBox(width: 4),
              ],
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
