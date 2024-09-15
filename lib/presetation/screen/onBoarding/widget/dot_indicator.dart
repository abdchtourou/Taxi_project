import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lidamas/cubit/on_boarding_cubit.dart';
import 'package:lidamas/data/datasource/static.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...List.generate(
                OnBoardingList.length,
                (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      margin: const EdgeInsets.only(right: 5),
                      width: cubit.currentPage == index ? 20 : 6,
                      height: 6,
                      decoration:  BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    )),
          ],
        );
      },
    );
  }
}
