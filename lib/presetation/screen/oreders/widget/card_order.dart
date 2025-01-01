import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/core/utils/extensions.dart';
import 'package:lidamas/cubit/booking/booking_cubit.dart';

import '../../../../core/routing/routes.dart';
import 'custom_row.dart';
import 'details_order.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({super.key,required  this.count,required this.fromTo,required this.date,required this.cubit});
  final count;
  final fromTo;
  final date;
  final BookingDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      width: 382.w,
      height: 284.h,
      decoration: BoxDecoration(
        color: const Color(0xFF0E151B),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color(0xFF555555),
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
             DetailsOrder(count: count, fromTo: fromTo, date: date,),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    context.pushNamed(Routes.details,arguments: cubit.bookingModel);

                  },
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
