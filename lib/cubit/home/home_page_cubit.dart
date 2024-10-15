import 'package:bloc/bloc.dart';

import 'home_page_state.dart';


class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(selectedIndex: 0));

  void changeIndex(int index) {
    emit(NavigationState(selectedIndex: index));
  }
}
