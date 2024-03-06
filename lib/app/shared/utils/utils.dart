import 'package:flutter/material.dart';

/// Parse locale string to locale: en_US -> Locale("en", "US")
Locale parseLocale(String localeString) {
  final List<String> parts = localeString.split('_');
  return Locale(parts[0], parts[1]);
}

/// Formats a double string with commas, checking for completeness after the decimal point.
String formatDoubleWithCommas(String doubleString) {
  List<String> parts = doubleString.split('.');
  String number = parts[0];

  try {
    BigInt bigInteger = BigInt.parse(number);
    // Format the BigInt with commas.
    String formattedNumber = formatBigIntegerWithCommas(bigInteger);

    // If there is a decimal part, append it to the formatted integer part, separated by a decimal point.
    if (parts.length > 1) {
      String decimal = parts[1];
      return '$formattedNumber.$decimal';
    }
    // Otherwise, simply return the formatted integer part.
    else {
      return formattedNumber;
    }
  } catch (e) {
    // If the integer part cannot be parsed into a BigInt, throw an exception.
    throw FormatException('Not valid double format: $e');
  }
}

/// Adds commas to every 3 characters of a BigInt.
String formatBigIntegerWithCommas(BigInt value) {
  String stringValue = value.toString();
  int numberLength = stringValue.length;
  List<String> groups = [];

  for (int i = numberLength; i > 0; i -= 3) {
    // Get the start index of the current group of 3 characters.
    int start = i - 3;
    if (start < 0) start = 0;

    // Get the current group of 3 characters.
    String group = stringValue.substring(start, i);
    // Add the current group of 3 characters to the list of groups.
    groups.insert(0, group);
  }

  // Join the list of groups together with commas.
  return groups.join(',');
}
