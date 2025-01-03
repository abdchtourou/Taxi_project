import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/cubit/booking/booking_cubit.dart';
import 'package:lidamas/presetation/screen/booking_screen/widgets/booking_details_form.dart';
import 'package:lidamas/presetation/screen/booking_screen/widgets/car_card.dart';
import 'package:lidamas/presetation/screen/booking_screen/widgets/trip_details_form.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: BuildHeader(
                title: 'احجز رحلتك الآن',
                description: 'احجز رحلتك الآن خلال ثوان معدودة...',
              )),
              const SizedBox(height: 24),
              const BookingFormState(),
              const Text("نوع السيارة"),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CarCard(); // Replace with your widget
                },
              ),
              const TripDetailsForm(),
              BlueButton(
                  onPressed: () {
                    context.read<BookingDetailsCubit>().addBooking();
                    print(context.read<BookingDetailsCubit>().bookingList);
                  },
                  text: 'احجز')
            ],
          ),
        ),
      ),
    );
  }
}
