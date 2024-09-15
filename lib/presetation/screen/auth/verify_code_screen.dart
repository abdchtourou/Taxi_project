import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/presetation/screen/auth/widget/pin_code_field.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPasswordVerification extends StatelessWidget {
  const ResetPasswordVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E151B),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120.h), // Adjust the space on top
            Text(
              'نسيت كلمة المرور',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'تم إرسال الرمز إلى ',
                style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: '*** *** 70',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            PinCodeField(),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                // Add your resend logic here
              },
              child: Text(
                'لم أتلقَ أي رمز؟ أعد الإرسال مرة أخرى',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Spacer(),
            BlueButton(text: 'تحقق',onPressed: (){},),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }}

