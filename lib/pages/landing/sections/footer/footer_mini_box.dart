// FooterMiniBox Widget
import 'package:flutter/material.dart';

class FooterMiniBox extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterMiniBox({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => Text(
            item,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
