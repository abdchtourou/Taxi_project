import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHeader extends StatelessWidget {
  BuildHeader({super.key, required this.title, this.description});

  final String title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        if (description != null)
           Text(description!,
              style: const TextStyle(
                height: 1.47,
                letterSpacing: 0.02,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 119, 119, 119),

              ),
           textAlign: TextAlign.center,),
      ],
    );
  }
}
