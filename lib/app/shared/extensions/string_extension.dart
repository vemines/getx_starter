import 'package:flutter/foundation.dart';

extension AppStringValidator on String {
  /// Check is String valid Email
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension AppStringProcess on String {
  // build web folder is assets/assets so when build need add --release flag
  String prefixAssets() {
    return kReleaseMode && kIsWeb ? "assets/$this" : this;
  }
}
