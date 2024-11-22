part of 'booking_cubit.dart';

class BookingDetailsState {
  final String from;
  final String to;
  final bool isReturnChecked;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  BookingDetailsState(
      {this.from = '',
      this.to = '',
      this.isReturnChecked = false,
      this.selectedDate,
      this.selectedTime});

  BookingDetailsState copyWith(
      {String? from,
      String? to,
      bool? isReturnChecked,
      DateTime? selectedDate,
      TimeOfDay? selectedTime}) {
    return BookingDetailsState(
        from: from ?? this.from,
        to: to ?? this.to,
        isReturnChecked: isReturnChecked ?? this.isReturnChecked,
        selectedDate: selectedDate ?? this.selectedDate,
        selectedTime: selectedTime ?? this.selectedTime);
  }
}
