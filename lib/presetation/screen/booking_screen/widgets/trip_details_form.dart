import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/booking/booking_cubit.dart';
import '../../../widgets/custom_text_field.dart';
import 'expandable_text_field.dart';

class TripDetailsForm extends StatelessWidget {
  const TripDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingDetailsCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: 'عدد الحقائب',
          icon: Icons.backpack,
          title: "عدد الحقائب",
          keyboardType: TextInputType.number,
          focusedBorderColors: Colors.white,
          controller: cubit.bagsController,
        ),
        CustomTextField(
          label: 'موقع الانطلاق',
          icon: Icons.my_location,
          title: "موقع الانطلاق",
          focusedBorderColors: Colors.white,
          controller: cubit.startLocationController,
        ),
        CustomTextField(
          label: 'الوجهة',
          icon: Icons.location_on_outlined,
          title: "الوجهة",
          focusedBorderColors: Colors.white,
          controller: cubit.destinationController,
        ),
        CustomTextField(
          label: 'الاسم الكامل',
          icon: Icons.person_2_outlined,
          title: "الاسم الكامل",
          keyboardType: TextInputType.text,
          focusedBorderColors: Colors.white,
          controller: cubit.fullName,
        ),
        const ExpandableTextField(
          label: 'Enter Description',
          icon: Icons.text_fields,
          title: 'Add Your Comment',
        ),
      ],
    );
  }
}
