import 'package:intl/intl.dart';

extension DateConvert on DateTime {
  String get convertYMD => DateFormat.yMd().format(this);
  String get convertYMMMD => DateFormat.yMMMMd().format(this);
}
