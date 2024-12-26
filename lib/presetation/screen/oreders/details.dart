import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/image_asset.dart';
import '../../../cubit/booking/booking_cubit.dart';
import '../../../cubit/home/home_page_cubit.dart';
import '../../widgets/build_header.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.cubit});
  final BookingDetailsCubit cubit;



  @override
  Widget build(BuildContext context) {
    Map<String, String> data = {

    'الرحلة': 'من {cubit.startLocationController.text} إلى {cubit.destinationController.text}',
    'موعد الرحلة': '12/9/2024 08:30 AM',
    'حالة الطلب': 'studentInfo',
    'ذهاب و عودة': 'نعم',
    'وثيقة الدخول': 'جنسية',
    'نوع السيارة': 'سيارة اقتصادية     1,025,000 ل.س',
    ' عدد الحقائب': '2',
    ' موقع الانطلاق': 'مطار دمشق',
    'الوجهة': 'مطار بيروت',
    'الاسم الكامل': 'اسم المسافر',
    'رقم الهاتف': '+963996352662',
    ' اسم السائق': 'اسم السائق',
  };
    return Scaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildHeader(
                title: 'طلباتي المحجوزة',
                description: "تصفح طلباتك و تعرف على المزيد",
              ),
            ],
          ),
          SizedBox(height: 20.h),

          const Text("حجز رقم 1     ",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 10.h,),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: data.entries.map(
                            (entry) {
                          return CustomDataRow(
                            label: entry.key,
                            value: entry.value,
                          );
                        }
                    ).toList()

                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}


class CustomDataRow extends StatelessWidget {
  final String label;
  final String value;

  CustomDataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        child: Row(
          children: [
            if(label=="حالة الطلب")
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
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
                ),
              )
            else
            Expanded(
              flex:2,
              child: Text(
                textAlign: TextAlign.end,
                value,
                style:  TextStyle(
                  color:  Colors.white,
                  fontSize: 15.sp
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                textAlign: TextAlign.end,
                ': '+label,
                style:  TextStyle(
                  color: Color(0xB2FFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
