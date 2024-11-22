import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lidamas/cubit/booking/booking_cubit.dart';

import 'gradient_checkbox.dart';

class BookingFormState extends StatelessWidget {
  const BookingFormState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingDetailsCubit>();
    return BlocBuilder<BookingDetailsCubit, BookingDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdownField('من', (value) {
              cubit.setFrom(value!);
            }),
            SizedBox(height: 20.h),
            buildDropdownField('إلى', (value) {
              cubit.setTo(value!);
            }),
            const SizedBox(height: 24),
            const Text(
              'الوقت و التاريخ',
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            buildDateTimePicker(context, cubit),
            const SizedBox(height: 24),
            Text(
              'ذهاب وعودة',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientCheckbox(
                  value: cubit.state.isReturnChecked,
                  onChanged: (value) {
                    cubit.toggleReturnChecked(value!);
                  },
                ),
                SizedBox(width: 19.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الانتظار اول ساعتين مجانا (في حال مقابلة سفارة أو ...)',
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'في حال التجاوز سيتم فرض قيمة اضافية يتم تحديدها بعد التواصل معك',
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "  وثيقة الدخول",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            buildDropdownField('اختر نوع وثيقة الدخول', (value) {
              cubit.setType(value!);
            }),
            SizedBox(
              height: 40.h,
            ),
          ],
        );
      },
    );
  }

  Widget buildDropdownField(String hint, void Function(String?)? onChanged) {
    return SizedBox(
      height: 60.h,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            filled: true,
            fillColor: const Color(0xFF0E151B),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white60),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
          dropdownColor: const Color(0xFF1A1A1A),
          items: const [
            DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
            DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
            DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
          ],
          onChanged: onChanged),
    );
  }

  Widget buildDateTimePicker(BuildContext context, BookingDetailsCubit cubit) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null) {
            cubit
                .changeDate(DateFormat.yMd().format(date));
            cubit.changeTime(time.format(context));
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF0E151B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white54),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey[400]),
            const SizedBox(width: 10),
            Text(
              cubit.state.selectedDate == null ||
                      cubit.state.selectedTime == null
                  ? 'حدد التاريخ و الوقت'
                  : '${cubit.state.selectedDate!}   ${cubit.state.selectedTime!}',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
