import 'package:intl/intl.dart';

class DateFormatFunc {
  static String formatDayNameDayNumMonNameYearNum(
      {required DateTime dateTime, String commaType = "-"}) {
    return DateFormat("EEEE $commaType dd MMM $commaType yyyy")
        .format(dateTime);
  }

  static String formatDayNumMonthNum(
      {required DateTime? dateTime, String commaType = "-"}) {
    if (dateTime==null) {
      return "";
    }
    return DateFormat("dd $commaType MM")
        .format(dateTime);
  }

  static String formatDayNumMonthNumYearNum(
      {required DateTime? dateTime, String commaType = "-"}) {
    if (dateTime==null) {
      return "";
    }
    return DateFormat("dd $commaType MM $commaType yyy")
        .format(dateTime);
  }

  static String formatYearNumMonthNumDayNum(
      {required DateTime? dateTime, String commaType = "-"}) {
    if (dateTime==null) {
      return "";
    }
    return DateFormat("yyy${commaType}MM${commaType}dd")
        .format(dateTime);
  }

  static String formatHoursMinutes(
      {required DateTime dateTime, String commaType = ":"}) {
    return DateFormat("hh:mm a").format(dateTime);
  }

  static int getDaysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String formatDayMonth({required DateTime dateTime}){
    return DateFormat.MMMd().format(dateTime);
  }
  static String formatDayMonthUnderLine({required DateTime dateTime}){
    return "${DateFormat.d().format(dateTime)} \n ${DateFormat.MMM().format(dateTime)}";
  }
  static String formatTimeAmPm({required DateTime dateTime}){
    return DateFormat.jm().format(dateTime);
  }
}
