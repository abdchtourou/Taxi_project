import 'package:flutter/material.dart';

import '../../../widgets/buttons.dart';
import 'body_page_view.dart';
import 'dot_indicator.dart';

class OnboardigDesign extends StatelessWidget {
  const OnboardigDesign({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: DotIndicator()),
          ),
        ),
         Expanded(
          flex: 1,
          child: BodyPageView(title: title,),
        ),

      ],
    );
  }
}
