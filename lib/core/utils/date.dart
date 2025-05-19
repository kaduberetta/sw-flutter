import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static const String date = 'dd/MM/yyyy';
  static const String dBDate = 'yyyy-MM-dd';
  static const String dateTime = 'dd/MM/yyyy HH:mm:ss';

  static String format(DateTime? date, {String format = dateTime}) {
    final it = DateFormat(format);
    date = date?.toLocal();
    return date != null ? it.format(date) : '';
  }

  static String formatInFull(DateTime? date) {
    final it = DateFormat('EEEE, dd MMMM yyyy HH:mm:ss', 'pt_BR');
    date = date?.toLocal();
    return date != null ? it.format(date) : '';
  }
}
