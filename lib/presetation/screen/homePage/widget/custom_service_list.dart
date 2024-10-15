import 'package:flutter/material.dart';

import '../../../../core/utils/image_asset.dart';
import 'custom_service_card.dart';

class CustomServiceList extends StatelessWidget {
  const CustomServiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

        return const Column(
          children: [
            CustomServiceCard(
              title: 'سهولة الاستخدام',
              description:
                  'قمنا بتطوير تكنولوجيا طلب حجز الرحلة بشكل سهل لنجعل خدمة الزبائن أكثر عملية!',
              imagePath: ImageAsset.phone,
            ),
            CustomServiceCard(
              title: 'لأمان والسرية',
              description:
                  'بفضل نظام التقييم دائما نختار أفضل الكباتن وندعمهم بالتدريب.',
              imagePath: ImageAsset.lock,
            ),
            CustomServiceCard(
              title: 'خدمة الزبون',
              description: 'نتواصل دائما مع الزبائن لمعرفة ما يمكنن تحسينه.',
              imagePath: ImageAsset.headPhone,
            ),
          ],
        );

  }
}
