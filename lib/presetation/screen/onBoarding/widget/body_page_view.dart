import 'package:flutter/material.dart';

import '../../../../data/datasource/static.dart';

class BodyPageView extends StatelessWidget {
  const BodyPageView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dots indicator (can be customized with actual functionality)
          const SizedBox(height: 20),
          // Title text
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Subtitle text
          Text(
            OnBoardingList[0].body,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
