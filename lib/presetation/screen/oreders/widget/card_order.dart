import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_row.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({super.key,required  this.count,required this.fromTo,required this.date});
  final count;
  final fromTo;
  final date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      width: 382.w,
      // Width of the container
      height: 284.h,
      // Height of the container
      decoration: BoxDecoration(
        color: const Color(0xFF0E151B), // Background color: #0E151B
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color(0xFF555555), // Border color: #555555
          width: 0.5, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                        vertical: 12.h, horizontal: 24.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        'تفاصيل الرحلة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
