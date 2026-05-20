import 'package:intl/intl.dart';

class ClientFormatters {
  static String phone(String? value) {
    if (value == null || value.isEmpty) return "-";

    final digits = value.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 11) {
      return "(${digits.substring(0, 2)}) "
          "${digits.substring(2, 7)}-${digits.substring(7)}";
    }

    if (digits.length == 10) {
      return "(${digits.substring(0, 2)}) "
          "${digits.substring(2, 6)}-${digits.substring(6)}";
    }

    return value;
  }

  static String cnpj(String? value) {
    if (value == null || value.isEmpty) return "-";

    final digits = value.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 14) return value;

    return "${digits.substring(0, 2)}."
        "${digits.substring(2, 5)}."
        "${digits.substring(5, 8)}/"
        "${digits.substring(8, 12)}-"
        "${digits.substring(12)}";
  }

  static String money(double? value) {
    if (value == null) return "R\$ 0,00";

    final format =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return format.format(value);
  }
}