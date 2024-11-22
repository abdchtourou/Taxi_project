part of 'booking_cubit.dart';

class BookingDetailsState {
  final String from;
  final String to;
  final bool isReturnChecked;
  String? selectedDate;
  String? selectedTime;
  final String type;

  BookingDetailsState(
      {this.type='',
      this.from = '',
      this.to = '',
      this.isReturnChecked = false,
      this.selectedDate,
      this.selectedTime});

  BookingDetailsState copyWith(
      {String? from,
      String? to,
      String? type,
      bool? isReturnChecked,
      String? selectedDate,
      String? selectedTime

      }) {
    return BookingDetailsState(
        from: from ?? this.from,
        to: to ?? this.to,
        type: type ?? this.type,
        isReturnChecked: isReturnChecked ?? this.isReturnChecked,
        selectedDate: selectedDate ?? this.selectedDate,
        selectedTime: selectedTime ?? this.selectedTime);
  }
}
