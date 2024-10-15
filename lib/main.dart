import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/cubit/auth/forget_password_cubit.dart';
import 'package:lidamas/presetation/screen/auth/forget_password.dart';
import 'package:lidamas/presetation/screen/auth/rest_password.dart';
import 'package:lidamas/presetation/screen/auth/sign_up.dart';
import 'package:lidamas/presetation/screen/auth/verify_code_screen.dart';
import 'package:lidamas/presetation/screen/homePage/home_page.dart';

import 'core/routing/app_router.dart';
import 'core/utils/app_them.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
      Brightness.light, // White icons in the status bar
    ));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // Adjust the design size based on your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.themeData,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          home: HomePage(),
        );
      },
    );
  }
}
