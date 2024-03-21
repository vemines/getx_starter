// Contain translate of app. Default language is English US
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../utils/flatten_map.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {};

  static Future<void> initLanguages() async {
    final Map<String, Map<String, String>> keys = {};
    List<String> languageCodes = ["en", "vi"];
    for (var e in languageCodes) {
      keys.addAll(await registerLanguage(e));
    }
    Get.clearTranslations();
    Get.addTranslations(keys);
  }

  static Future<Map<String, Map<String, String>>> registerLanguage(
    String languageCode,
  ) async {
    final res = await rootBundle.loadString('assets/lang/$languageCode.json');
    Map<String, dynamic> json = jsonDecode(res);
    final i18 = I18nModel.fromJson(json);
    return {i18.code!: i18.texts!};
  }
}

class I18nModel {
  String? name;
  String? code;
  Map<String, String>? texts;

  I18nModel({this.name, this.code, this.texts});

  I18nModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    if (json['texts'] != null) {
      texts = Map<String, String>.from(flatten(json['texts']));
    }
  }
}

// usage: LocaleKeys.hello.tr, LocaleKeys.param.trParam
class LocaleKeys {
  LocaleKeys._();
  static const hello = 'hello';
  static const param = 'param';
  static const nestedKey1 = 'nested.key1';
}
