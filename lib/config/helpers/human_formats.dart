import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number, [int decimals = 0]) =>
      NumberFormat.compactCurrency(
              decimalDigits: decimals, symbol: '', locale: 'en')
          .format(number);
}
