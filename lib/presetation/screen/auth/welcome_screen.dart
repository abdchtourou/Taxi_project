import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/core/routing/routes.dart';
import 'package:lidamas/core/utils/extensions.dart';
import 'package:lidamas/core/utils/image_asset.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';
import 'package:lidamas/presetation/widgets/buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
            ),
            BuildHeader(title: 'اهلاً بك',description: "احصل على تجربة مميزة باستخدام تطبيقنا",),

            SizedBox(
              height: 50.h,
            ),
            Image.asset(ImageAsset.logo),
            const Spacer(),
            Buttons(
                firstTextButton: 'إنشاء حساب',
                secTextButton: 'تسجيل الدخول',
                firstButtonOnPressed: () {},
                secButtonOnPressed: () {
                  context.pushNamed(Routes.login);
                })
          ],
        ),
      ),
    );
  }
}
