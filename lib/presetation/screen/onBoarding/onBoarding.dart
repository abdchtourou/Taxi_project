import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lidamas/core/utils/extensions.dart';
import 'package:lidamas/presetation/screen/onBoarding/widget/onboardig_Design.dart';
import 'package:lidamas/presetation/widgets/buttons.dart';

import '../../../core/routing/routes.dart';
import '../../../cubit/on_boarding_cubit.dart';
import '../../../data/datasource/static.dart';

  class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<OnBoardingCubit, int>(
            builder: (context, state) {
              return Expanded(
                child: PageView.builder(
                    itemCount: OnBoardingList.length,
                    onPageChanged: (val) {
                      cubit.changePage(val);
                    },
                    controller: cubit.pageController,
                    itemBuilder: (context, i) {
                      final item = OnBoardingList[i];
                      return OnboardigDesign(
                        image: item.image,
                        title: item.title,
                      );
                    }),
              );
            },
          ),
          Buttons(
            firstTextButton: 'التالي',
            secTextButton: 'تخطي',
            firstButtonOnPressed: () {
              if (cubit.currentPage < OnBoardingList.length - 1) {
                cubit.nextPage();
              } else {
                context.pushReplacementNamed(Routes.welcomeScreen);
              }
            },
            secButtonOnPressed: () {
              context.pushReplacementNamed(Routes.welcomeScreen);
            },
          )
        ],
      ),
    );
  }
}
