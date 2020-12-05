import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}

extension DateTimeFormat on DateTime {
  static const FORMAT_MM_DD_YYYY = "MM/dd/yyyy";
  static const FORMAT_MM_DD_YYYY_HH_mm_A = "MM/dd/yyyy h:mm a";

  String formatDate(String format) {
    if (this == DateTime.fromMicrosecondsSinceEpoch(0))
      return ""; // This is the invalid date
    return DateFormat(format).format(this);
  }
}

extension DateTimeGetter on DateTime {
  int getTimestampAtStartOfDay() {
    return DateTime(this.year, this.month, this.day, 0, 0, 0)
        .millisecondsSinceEpoch;
  }

  int getTimestampAtEndOfDay() {
    return DateTime(this.year, this.month, this.day, 24, 0, 0)
        .millisecondsSinceEpoch;
  }
}
