

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/image_asset.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
        toolbarHeight: 60.h,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الأسئلة العامة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15.w),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(ImageAsset.logo),
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF0E151B),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFAQItem(
              title: "هل من الممكن توصيل أغراضي في يومي؟",
              description: "نعم، نحن نقدم خدمة التوصيل في نفس اليوم بناءً على موقعك.",
            ),
            _buildFAQItem(
              title: "هل من الممكن أن أستبدل المنتج الذي طلبته بالنسخة؟",
              description: "بالطبع، يمكنك طلب استبدال المنتج خلال فترة الضمان.",
            ),
            _buildFAQItem(
              title: "ما هي مدة الرحلة من مدينتي إلى بيروت؟",
              description: "مدة الرحلة تعتمد على وسيلة النقل وتستغرق عادةً من 2 إلى 4 ساعات.",
            ),
            _buildFAQItem(
              title: "من أين يمكن أن يحصّلني السائق؟",
              description: "يمكنك تحديد مكان التحصيل عند طلب الخدمة.",
            ),
            _buildFAQItem(
              title: "هل يتوفر واي فاي في السيارة؟",
              description: "نعم، معظم سياراتنا مزودة بخدمة الواي فاي المجانية.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String title, required String description}) {
    return Card(
      color: Color(0xFF0E151B),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
