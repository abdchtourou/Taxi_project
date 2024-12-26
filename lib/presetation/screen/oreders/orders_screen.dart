import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/cubit/booking/booking_cubit.dart';
import 'package:lidamas/presetation/screen/oreders/widget/card_order.dart';
import 'package:lidamas/presetation/screen/oreders/widget/no_bookings_message.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingDetailsCubit>();
    return Scaffold(
      // backgroundColor: const Color(0xFF0E151B), // Background color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          BuildHeader(
            title: 'طلباتي المحجوزة',
            description: "تصفح طلباتك و تعرف على المزيد",
          ),
          SizedBox(height: 40.h),
          if (cubit.bookingList.isEmpty)
            const NoBookingsMessageWidget()
          else
            Expanded(child: ListView.builder(
              itemCount: cubit.bookingList.length,

                itemBuilder: (context, index) {
              return CardOrder(
                count: index + 1,
                fromTo: cubit.bookingList[index].from,
                date: cubit.bookingList[index].date,
                cubit: cubit,
              );
            }))
        ],
      ),
    );
  }
}
