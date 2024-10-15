import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/image_asset.dart';
import '../../../widgets/build_header.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(context),
        _buildOverlayContent(context),
        _buildArrowIcon(),
        _buildBookNowButton(),
      ],
    );
  }
}
Widget _buildBackgroundImage(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height - 89.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImageAsset.bgHomePage),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildOverlayContent(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height - 89.h,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: const Alignment(0, 2),
        colors: [
          const Color(0xFF0E151B).withOpacity(0.2),
          const Color(0xFF0E151B).withOpacity(0.5),
          const Color(0xFF0E151B),
          const Color(0xFF0E151B),
        ],
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BuildHeader(
              title: "لداماس تقدم لكم أفضل رحلة",
              description:
              "أفضل الرحل و بأنسب الأسعار، للحصول على تجربة مميزة ما عليك سوى الحجز لدينا و ترك الباقي علينا",
              colors: Colors.white,
            ),
          ),
          SizedBox(height: 200.h),
        ],
      ),
    ),
  );
}

Widget _buildArrowIcon() {
  return Positioned(
    top: 340.h,
    right: 10.w,
    child: Image.asset(ImageAsset.arrow),
  );
}

Widget _buildBookNowButton() {
  return Positioned(
    top: 420.h,
    right: 60.w,
    child: SizedBox(
      width: 250,
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 2),
          padding: const EdgeInsets.only(bottom: 10),
        ),
        child: Text(
          "احجز الآن",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
      ),
    ),
  );
}