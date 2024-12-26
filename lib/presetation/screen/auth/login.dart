import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lidamas/core/routing/routes.dart';
import 'package:lidamas/core/utils/extensions.dart';
import 'package:lidamas/presetation/screen/auth/widget/password_field.dart';
import 'package:lidamas/presetation/widgets/blue_button.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  bool isHide=true;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120.h),
           BuildHeader(title: "تسجيل الدخول"),
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildPhoneField(),
                    SizedBox(height: 20.h),
                    PasswordField(focusNode: _focusNode,isHide: isHide,),
                    _buildForgotPasswordButton(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 280.h),
            BlueButton(text: 'تسجيل الدخول',onPressed: (){
              context.pushNamed(Routes.homePage);
            },),
            _buildSignUpText(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      controller: _phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(),
      ),
      initialCountryCode: 'SY',
      style: const TextStyle(color: Colors.white),
      dropdownTextStyle: const TextStyle(color: Colors.white),
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }

  Widget _buildPasswordField() {

    return TextFormField(
      focusNode: _focusNode,
      obscureText: isHide,

      decoration: InputDecoration(
        labelText: 'كلمة المرور',
        suffixIcon: IconButton(
          icon:!isHide? Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash),
          onPressed: (){
            setState(() {
              isHide=!isHide;
              print(isHide);
            });

          },
        ),
        labelStyle: TextStyle(
          color: _focusNode.hasFocus ? Colors.white : Colors.grey,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.forgetPassword);
        },
        child: SizedBox(
          height: 50.h,
          width: 110.w,
          child: CustomPaint(
            painter: UnderlinePainter(
              color: Colors.grey,
              text: 'نسيت كلمة المرور؟',
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
              textHeight: 16.sp,
              underlinePadding: 10.0,
            ),
          ),
        ),
      ),
    )
    ;
  }


  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟ ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
          TextSpan(
            text: 'إنشاء حساب الآن',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.sp,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              context.pushNamed(Routes.signUp);
                print('Create Account tapped');
              },
          ),
        ],
      ),
    );
  }
}

class UnderlinePainter extends CustomPainter {
  final Color color;
  final String text;
  final TextStyle textStyle;
  final double textHeight;
  final double underlinePadding;

  UnderlinePainter({
    required this.color,
    required this.text,
    required this.textStyle,
    required this.textHeight,
    required this.underlinePadding,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(canvas, Offset.zero);

    final double underlineY = textHeight + underlinePadding;
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawLine(
      Offset(0, underlineY),
      Offset(textPainter.width, underlineY),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
