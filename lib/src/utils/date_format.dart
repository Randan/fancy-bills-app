import 'package:intl/intl.dart';

String dateFromIso(String iso) {
  final DateTime now = DateTime.parse(iso);
  final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm:ss');
  final String formatted = formatter.format(now);

  return formatted;
}
