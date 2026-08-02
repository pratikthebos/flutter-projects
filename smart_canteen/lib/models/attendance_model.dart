class AttendanceModel {
  final int totalStaff;
  final int present;
  final int absent;
  final int leave;

  AttendanceModel({
    required this.totalStaff,
    required this.present,
    required this.absent,
    required this.leave,
  });

  double get attendancePercentage =>
      (present / totalStaff) * 100;
}