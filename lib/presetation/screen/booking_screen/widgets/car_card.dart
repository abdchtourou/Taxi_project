import 'package:flutter/material.dart';
import 'package:lidamas/core/utils/image_asset.dart';

class CarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4F7191),
            Color(0xFF436481),

            Color(0xFF0E151B),
            
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Image
          Container(
            height: 200,

            decoration: BoxDecoration(
              color: const Color(0xFF2A3A4A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                ImageAsset.car ,
                fit: BoxFit.contain,
                height: 80,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Price
          Row(
            children: [
              Text(
                '1,125,000', // Original price
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 8),
            const  Text(
                '1,025,000', // Discounted price
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Car Type and Passenger Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                'سيارة اقتصادية', // Car type
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '4 ركاب', // Passengers info
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
