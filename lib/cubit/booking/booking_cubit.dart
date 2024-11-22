import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/model/booking_model.dart';

part 'booking_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit() : super(BookingDetailsState());
  TextEditingController numberOfPage = TextEditingController();
  TextEditingController startingPoint = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController notes = TextEditingController();

  void setFrom(String value) {
    emit(state.copyWith(from: value));
  }

  void setType(String value) {
    emit(state.copyWith(type: value));
  }

  void setTo(String value) {
    emit(state.copyWith(to: value));
  }

  void toggleReturnChecked(bool value) {
    emit(state.copyWith(isReturnChecked: value));
  }

  void changeDate(String date) {
    emit(state.copyWith(selectedDate: date));
  }

  void changeTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  List<BookingModel> bookingList = [];

  void addBooking() {
    print("${state.selectedDate} ${state.selectedTime}//////////////////////////////");
    bookingList.add(BookingModel(
        from: state.from,
        to: state.to,
        date: "${state.selectedDate}  ${state.selectedTime}",
        isReturened: state.isReturnChecked,
        type: state.type,
        numOfPage: numberOfPage.text,
        startingPoint: startingPoint.text,
        destination: destination.text,
        fullName: fullName.text));
  }
}
