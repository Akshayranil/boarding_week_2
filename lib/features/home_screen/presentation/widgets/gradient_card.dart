import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2C2C2C), // soft black
            Color.fromARGB(255, 100, 19, 9), // medium brown/red
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Title Text",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: "Slash sale begins in April. Get up to 80% \nDiscount on all products ",style: TextStyle(fontSize: 16)
                ),
                TextSpan(
                  text: "Read More",
                  style: TextStyle(
                    color: Colors.white,         // white color
                    fontWeight: FontWeight.bold, // bold
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
        ],
      ),
    );
  }
}