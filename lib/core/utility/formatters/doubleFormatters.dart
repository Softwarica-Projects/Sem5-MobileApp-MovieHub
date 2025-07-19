import 'package:flutter/services.dart';
import 'package:moviehub/core/utility/regexp/regexp.dart';

class DoubleFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final value = ExpressionPatterns().doubleRegExp.hasMatch(newValue.text);
    if (value) {
      return newValue;
    }
    return oldValue;
  }
}
