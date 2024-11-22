import 'package:bloc/bloc.dart';

import 'home_page_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(selectedIndex: 0));
  final List<String> pageTitles = [
    'الصفحة الرئيسية',
    'حجز رحلة',
    'طلباتي',
    'الإشعارات'
  ];

  void changeIndex(int index) {
    emit(NavigationState(selectedIndex: index));
  }
  String get currentPageTitle => pageTitles[state.selectedIndex];
}
