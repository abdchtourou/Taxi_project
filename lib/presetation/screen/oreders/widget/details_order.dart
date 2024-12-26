import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_row.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key, required this.count, required this.fromTo, required this.date});
  final int count;
  final String fromTo;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$count رقم ",
          style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),

        ),
        SizedBox(
          height: 30.h,
        ),
        CustomRow(
          text1: fromTo,
          text2: ": الرحلة",
          leftPadding: 20.w,
          gapWidth: 50.w,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomRow(
          text1: date,
          text2: ": موعد الرحلة",
          leftPadding: 20.w,
          gapWidth: 20.w,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 90.0.w,
              height: 27.0.h,
              decoration: const BoxDecoration(
                  color: Color(0xFF026E00),
                  borderRadius:
                  BorderRadius.all(Radius.circular(14.0))),
              child: const Text(
                "مثبت",
                style:
                TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Text(
              " : حالة الطلب ",
              style: TextStyle(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
