import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: isSelected ? Colors.grey.withOpacity(0.3) : Colors.grey[900],
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey[700]!,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            _buildGradientCircularContainer(icon, isSelected),
          ],
        ),
      ),
    );
  }
}

Widget _buildGradientCircularContainer(IconData icon, bool isSelected) {
  return Container(
    width: 44.r,
    height: 44.r,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment(-0.9, -1),
        end: Alignment(0.9, 1),
        colors: [
          Color(0xFF0E151B),
          Color(0xFF436481),
        ],
      ),
    ),
    child: Center(
      child: Icon(
        icon,
        color: Colors.white,
        size: 20.sp,
      ),
    ),
  );
}