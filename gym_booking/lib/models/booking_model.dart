class BookingModel {
  final String date;
  final String time;
  final String gymArea;
  final String trainer;
  final bool booked;

  const BookingModel({
    required this.date,
    required this.time,
    required this.gymArea,
    required this.trainer,
    required this.booked,
  });
}