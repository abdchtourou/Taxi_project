import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit() : super(BookingDetailsState());

  void setFrom(String value) {
    emit(state.copyWith(from: value));
  }

  void setTo(String value) {
    emit(state.copyWith(to: value));
  }

  void toggleReturnChecked(bool value) {
    emit(state.copyWith(isReturnChecked: value));
  }
  void changeDate(DateTime date){
    emit(state.copyWith(selectedDate: date));
  }
  void changeTime(TimeOfDay time){
    emit(state.copyWith(selectedTime: time));
  }
}