import 'package:flutter/services.dart';

import '../utils.dart';

/// Format 123456789.123456789... -> 123,456,789.123456789...
class NumericTextFormatter extends TextInputFormatter {
  NumericTextFormatter();
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    bool isTextDiffence = newValue.text.compareTo(oldValue.text) != 0;

    // Case "0" or ""
    if (newValue.text.isEmpty || newValue.text == "0") {
      return newValue;
    }
    // Case where the new value is different from the old value
    else if (isTextDiffence) {
      // Get cursor of textfield
      final int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;

      // Remove commas from the text
      String doubleString = newValue.text.replaceAll(',', '');

      // Try to format the text as a double. If it is not possible, return the old text.
      try {
        final newString = formatDoubleWithCommas(doubleString);
        return TextEditingValue(
          text: newString,
          selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
        );
      } catch (e) {
        // Return the old text if the new text is not in a valid double format.
        return oldValue;
      }
    }
    return newValue;
  }
}
