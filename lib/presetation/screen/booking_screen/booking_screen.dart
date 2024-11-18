import 'dart:ui' as ui; // Import dart:ui and alias it

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lidamas/presetation/screen/booking_screen/widgets/car_card.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';

import '../../widgets/custom_text_field.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isReturnChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Text(
                      'احجز رحلتك الآن',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'احجز رحلتك الآن خلال ثوان معدودة...',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              buildDropdownField('من'),
              SizedBox(height: 20.h),
              buildDropdownField('إلى'),
              const SizedBox(height: 24),
              const Text(
                'الوقت و التاريخ',
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              buildDateTimePicker(),
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
                    value: isReturnChecked,
                    onChanged: (value) {
                      setState(() {
                        isReturnChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 19.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الانتظار اول ساعتين مجانا (في حال مقابلة سفارة أو ...)',
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'في حال التجاوز سيتم فرض قيمة اضافية يتم تحديدها بعد التواصل معك',
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "  وثيقة الدخول",
                style:
                    TextStyle(fontWeight: ui.FontWeight.w600, fontSize: 16.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              buildDropdownField('اختر نوع وثيقة الدخول'),
              SizedBox(
                height: 40.h,
              ),
              Text("نوع السيارة"),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                // Makes the ListView fit its children
                physics: NeverScrollableScrollPhysics(),
                // Disables ListView's independent scrolling
                itemCount: 5,
                // Replace with your dynamic item count
                itemBuilder: (context, index) {
                  return CarCard(); // Replace with your widget
                },
              ),
              CustomTextField(
                label: 'عدد الحقائب',
                icon: Icons.backpack,
                title: "عدد الحقائب",
                keyboardType: TextInputType.number,
                focusedBorderColors: Colors.white,
              ),
              CustomTextField(
                label: 'موقع الانطلاق',
                icon: Icons.my_location,
                title: "موقع الانطلاق",
                focusedBorderColors: Colors.white,
              ),
              CustomTextField(
                label: 'الوجهة',
                icon: Icons.location_on_outlined,
                title: "الوجهة",
                focusedBorderColors: Colors.white,
              ),
              CustomTextField(
                label: 'الاسم الكامل',
                icon: Icons.person_2_outlined,
                title: "الاسم الكامل",
                keyboardType: TextInputType.number,
                focusedBorderColors: Colors.white,
              ),

              ExpandableTextField(
                label: 'Enter Description',
                icon: Icons.text_fields,
                title: 'Add Your Comment',
              ),

              BlueButton(onPressed: (){}, text: 'احجز')

            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String hint) {
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
        onChanged: (value) {},
      ),
    );
  }

  Widget buildDateTimePicker() {
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
            setState(() {
              selectedDate = date;
              selectedTime = time;
            });
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
              selectedDate == null || selectedTime == null
                  ? 'حدد التاريخ و الوقت'
                  : '${DateFormat.yMd().format(selectedDate!)}   ${selectedTime!.format(context)}',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  GradientCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          gradient: value
              ? const LinearGradient(
                  begin: Alignment(-0.9, -1),
                  end: Alignment(0.9, 1),
                  colors: [
                    Color(0xFF0E151B),
                    Color(0xFF436481),
                  ],
                )
              : null,
          color: value ? null : Colors.transparent,
          border: Border.all(
            color: Colors.white60,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 18,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}


class ExpandableTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? title;

  const ExpandableTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.title,
  }) : super(key: key);

  @override
  _ExpandableTextFieldState createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  final TextEditingController _controller = TextEditingController();
  double _height = 400.0; // Set initial height to 400 pixels

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display title if it is not null or empty
        if (widget.title != null && widget.title!.isNotEmpty)
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(height: 8.h),

        // Container wrapping the TextField
        Container(
          width: double.infinity, // Make sure it fills the available width
          height: _height, // Set dynamic height
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _height,
            curve: Curves.easeInOut,
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: null, // Makes the TextField expandable vertically
              keyboardType: TextInputType.multiline,
              onChanged: (text) {
                setState(() {
                  // Update height based on content length
                  _height = (_controller.text.split('\n').length * 24).toDouble();
                  if (_height < 400) _height = 400; // Minimum height
                  if (_height > 600) _height = 600; // Maximum height (optional)
                });
              },
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
                suffixIcon: Icon(widget.icon, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

