import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/core/routing/routes.dart';
import 'package:lidamas/core/utils/extensions.dart';
import 'package:lidamas/cubit/auth/forget_password_cubit.dart';
import 'package:lidamas/presetation/screen/auth/widget/option_container.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            BuildHeader(
                title: 'نسيت كلمة المرور',
                description:
                    "حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك"),
            SizedBox(height: 40.h),
            BlocBuilder<ForgetPasswordCubit, RecoveryOption>(
              builder: (context, state) {
                return Column(
                  children: [
                    OptionContainer(
                      icon: Icons.sms,
                      title: 'SMS عبر رسالة ',
                      subtitle: '**** ***70',
                      isSelected: state == RecoveryOption.sms,
                      onTap: () {
                        cubit.selectSms();
                      },
                    ),
                    SizedBox(height: 20.h),
                    OptionContainer(
                      icon: Icons.email,
                      title: 'عبر البريد الإلكتروني',
                      subtitle: '**** **** xyz@xyz.com',
                      isSelected: state == RecoveryOption.email,
                      onTap: () {
                        cubit.selectEmail();
                      },
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            BlueButton(
              text: 'التالي ',
              onPressed: () {
                if(cubit.state==RecoveryOption.email){
                  print('sadfasdf');
                }else if(cubit.state==RecoveryOption.sms){
                  context.pushNamed(Routes.resetPasswordVerification);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
