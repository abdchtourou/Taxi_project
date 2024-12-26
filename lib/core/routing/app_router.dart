import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lidamas/core/routing/routes.dart';
import 'package:lidamas/cubit/auth/forget_password_cubit.dart';
import 'package:lidamas/cubit/booking/booking_cubit.dart';
import 'package:lidamas/cubit/on_boarding_cubit.dart';
import 'package:lidamas/presetation/screen/auth/forget_password.dart';
import 'package:lidamas/presetation/screen/auth/login.dart';
import 'package:lidamas/presetation/screen/auth/verify_code_screen.dart';
import 'package:lidamas/presetation/screen/homePage/home_page.dart';
import 'package:lidamas/presetation/screen/onBoarding/onBoarding.dart';
import 'package:lidamas/presetation/screen/oreders/details.dart';

import '../../presetation/screen/auth/sign_up.dart';
import '../../presetation/screen/auth/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                BlocProvider(
                  create: (context) => OnBoardingCubit(),
                  child: const Onboarding(),
                ));
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
        case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
        case Routes.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const Login());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => ForgetPasswordCubit(),
              child: ForgetPassword(),
            ));
      case Routes.resetPasswordVerification:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordVerification());
        case Routes.details:
          final cubit = settings.arguments as BookingDetailsCubit;
        return MaterialPageRoute(
            builder: (context) =>  Details(cubit: cubit,));

    }
  }
}
