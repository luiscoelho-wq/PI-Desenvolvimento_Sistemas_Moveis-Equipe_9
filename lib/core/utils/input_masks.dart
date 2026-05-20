import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 11) digits = digits.substring(0, 11);

    String formatted = '';

    for (int i = 0; i < digits.length; i++) {
      if (i == 3 || i == 6) formatted += '.';
      if (i == 9) formatted += '-';
      formatted += digits[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 14) digits = digits.substring(0, 14);

    String formatted = '';

    for (int i = 0; i < digits.length; i++) {
      if (i == 2 || i == 5) formatted += '.';
      if (i == 8) formatted += '/';
      if (i == 12) formatted += '-';
      formatted += digits[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 11) digits = digits.substring(0, 11);

    String formatted = '';

    if (digits.length >= 1) formatted += '(';
    if (digits.length >= 2) formatted += digits.substring(0, 2) + ') ';
    if (digits.length >= 7 && digits.length <= 10) {
      formatted += digits.substring(2, digits.length - 4);
      formatted += '-';
      formatted += digits.substring(digits.length - 4);
    } else if (digits.length == 11) {
      formatted += digits.substring(2, 7);
      formatted += '-';
      formatted += digits.substring(7);
    } else if (digits.length > 2) {
      formatted += digits.substring(2);
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}