import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';
import 'package:lidamas/presetation/widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E151B), // Dark background color
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          // Adding horizontal padding
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120.h),
                BuildHeader(title: 'إنشاء حساب'),
                SizedBox(height: 40.h),
                const CustomTextField(
                  label: 'الاسم الكامل',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 16.h),
                const CustomTextField(
                  label: 'البريد الإلكتروني',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 16.h),
                _buildPhoneField(),
                SizedBox(height: 320.h),
                BlueButton(onPressed: () {}, text: 'text')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      initialCountryCode: 'SY',
      // Default country code
      style: const TextStyle(color: Colors.white),
      dropdownTextStyle: const TextStyle(color: Colors.white),
      dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
