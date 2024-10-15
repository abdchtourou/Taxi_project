import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/presetation/screen/auth/widget/password_field.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

class RestPassword extends StatefulWidget {
  const RestPassword({super.key});

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Center(
                child: BuildHeader(
              title: "تعيين كلمة المرور جديدة",
              description: "قم بتعيين كلمة المرور الجديدة الخاصة بك",
            )),
            SizedBox(height: 50.h,),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 30.h),
              child: PasswordField(focusNode: _focusNode, isHide: isHide),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 30.h),
              child: PasswordField(focusNode: _focusNode, isHide: isHide),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlueButton(onPressed: (){}, text: 'text'),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
