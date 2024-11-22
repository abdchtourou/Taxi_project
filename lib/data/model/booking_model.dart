class BookingModel {
  final String from;

  final String to;
  final String date;
  final bool isReturened;
  final String type;
  final String numOfPage;
  final String startingPoint;
  final String destination;
  final String fullName;
  final notes;

  BookingModel({
    required this.from,
    required this.to,
    required this.date,
    required this.isReturened,
    required this.type,
    required this.numOfPage,
    required this.startingPoint,
    required this.destination,
    required this.fullName,
    this.notes,
  });
  }
