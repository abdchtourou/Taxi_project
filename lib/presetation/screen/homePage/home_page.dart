import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lidamas/core/utils/image_asset.dart';
import 'package:lidamas/presetation/screen/homePage/widget/custom_service_list.dart';
import 'package:lidamas/presetation/screen/homePage/widget/news_card.dart';
import 'package:lidamas/presetation/screen/homePage/widget/promo_section.dart';
import 'package:lidamas/presetation/widgets/build_header.dart';

import '../../../cubit/home/home_page_cubit.dart';
import '../../../cubit/home/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PromoSection(),
              const SizedBox(height: 30),
              BuildHeader(
                title: 'خدماتنا',
                description:
                    'تتميز لداماس بتقديمها خدمة التنقل الآمن والاستخدام الأسهل بشكل لائق وعصري.',
              ),
              const CustomServiceList(),
              SizedBox(
                width: double.infinity,
                height: 180.h,
                child: Image.asset(
                  ImageAsset.airport,
                ),
              ),
              const SizedBox(height: 70),
              BuildHeader(
                title: 'الأخبار',
                description: 'تصفح آخر الاخبار من عندنا',
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 294.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    String imageUrl = ImageAsset.people;
                    String title = 'عنوان الخبر $index';
                    String subtitle = 'عنوان فرعي للخبر $index';

                    return NewsCard(
                      imageUrl: imageUrl,
                      title: title,
                      subtitle: subtitle,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                backgroundColor: const Color(0xFF0E151B),
                type: BottomNavigationBarType.fixed, // Ensure this is set

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ' الصفحة الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.event_note,
                    ),
                    label: 'طلباتي',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_none,
                    ),
                    label: 'الإشعارات',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.airplanemode_active_outlined,
                    ),
                    label: 'حجز رحلة',
                  ),

                ],
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.white,
                currentIndex: state.selectedIndex,


                onTap: (index) {
                  context.read<NavigationCubit>().changeIndex(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 60.h,
      elevation: 2,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 15.w),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ImageAsset.logo),
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ],
    );
  }
}
