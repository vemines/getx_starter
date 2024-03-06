import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/helpers/hive_helper.dart';
import 'app/shared/theme/app_theme.dart';
import 'app/shared/translations/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init languages
  await AppLanguage.initLanguages();
  // init hive
  await HiveStorageHelper.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Routes
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // Themes
      theme: AppThemes.lightTheme.copyWith(
        textTheme: Typography.material2021().black,
      ),
      darkTheme: AppThemes.darkTheme.copyWith(
        textTheme: Typography.material2021().white,
      ),
      themeMode: ThemeMode.dark,
      // Language
      translations: AppLanguage(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.fade,
    );
  }
}
