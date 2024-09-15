import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';


class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);
   PageController pageController=PageController();
  void changePage(int index){
    currentPage=index;
    emit(currentPage);
  }
  int currentPage=0;

  void nextPage(){
    currentPage++;
    pageController.animateToPage(currentPage, duration: Duration(milliseconds: 900), curve: Curves.ease);
    emit(currentPage);
  }
}
