// custom_detail_widget.dart

import 'package:flutter/material.dart';

class CustomDetailWidget extends StatelessWidget {
  final String title;
  final String? value;

  const CustomDetailWidget({required this.title, this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? "N/A"),
          ),
        ],
      ),
    );
  }
}
