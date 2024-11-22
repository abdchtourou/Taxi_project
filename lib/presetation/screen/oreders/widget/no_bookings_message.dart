import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoBookingsMessageWidget extends StatelessWidget {
  const NoBookingsMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.05),
            Color.fromRGBO(153, 153, 153, 0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'ليس لديك أي طلبات محجوزة في الوقت الحالي. يمكنك حجز رحلة في أي وقت '
                'ما عليك سوى النقر على حجز رحلة أسفل الشاشة لتبدأ خطوات حجز طلبك',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            child: Text(
              'العودة إلى الصفحة الرئيسية',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
