import 'package:flutter/material.dart';

Widget arrowButton(
  BuildContext context,
  IconData icon,
  VoidCallback? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 20),
    ),
  );
}