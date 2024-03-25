import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/constants/dimens.dart';
import '../../shared/constants/values.dart';

import '../../routes/app_pages.dart';
import '../../shared/theme/theme_extension.dart';
import '../../shared/translations/translations.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/common.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("Preview"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(Dimensions.normal),
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset("assets/jpg/sample.jpeg"),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.all(Dimensions.normal)),
                  ),
                  onPressed: () => Get.toNamed(Routes.posts),
                  child: Text("Go Post Page",
                      style: textTheme.labelLarge!
                          .copyWith(color: colorScheme.onPrimary)),
                ),
              ],
            ),
            const _TextThemePreview(),
            gapL(),
            const _ColorPreview(),
            gapL(),
            const _TranslatePreview(),
          ],
        ),
      ),
    );
  }
}

class _TranslatePreview extends StatefulWidget {
  const _TranslatePreview();

  @override
  State<_TranslatePreview> createState() => _TranslatePreviewState();
}

class _TranslatePreviewState extends State<_TranslatePreview> {
  String currentLanguage = "en_US";
  void _onchangedLocale(String? value) {
    if (value != null) {
      setState(() {
        currentLanguage = value;
      });
      Get.updateLocale(parseLocale(currentLanguage));
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;
    return Column(
      children: [
        Text("Normal Text", style: textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.hello.tr, style: textTheme.bodyLarge),
        gapN(),
        Text("Param Text", style: textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.param.trParams({"param": "VeMines"}),
            style: textTheme.bodyLarge),
        gapN(),
        Text("Nested Text", style: textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.nestedKey1.tr, style: textTheme.bodyLarge),
        gapN(),
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusBorder.normal),
            color: colorScheme.surface,
          ),
          child: DropdownButton<String>(
            iconSize: 30,
            isExpanded: true,
            borderRadius: BorderRadius.circular(RadiusBorder.normal),
            focusColor: colorScheme.surface,
            dropdownColor: colorScheme.surface,
            underline: const DropdownButtonHideUnderline(child: SizedBox()),
            value: currentLanguage,
            items: supportLanguages.entries.map((entry) {
              return DropdownMenuItem<String>(
                value: entry.key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key, style: textTheme.bodyLarge),
                    Text(entry.value, style: textTheme.bodyLarge),
                  ],
                ),
              );
            }).toList(),
            onChanged: _onchangedLocale,
          ),
        ),
      ],
    );
  }
}

class _ColorWidget extends StatelessWidget {
  const _ColorWidget(this.name, this.color);
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    return SizedBox(
      width: 200,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(name, style: textTheme.bodyLarge),
          Container(width: 100, height: 100, color: color),
        ],
      ),
    );
  }
}

class _ColorPreview extends StatelessWidget {
  const _ColorPreview();

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;
    var colorThemeExt = context.theme.extension<ColorThemeExt>()!;
    return Column(
      children: [
        Wrap(
          runSpacing: Dimensions.normal,
          spacing: Dimensions.normal,
          children: [
            _ColorWidget("Info (theme extends)", colorThemeExt.info),
            _ColorWidget("Warning (theme extends)", colorThemeExt.warning),
            _ColorWidget("Success (theme extends)", colorThemeExt.success),
          ],
        ),
        gapN(),
        FilledButton(
          style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsets.all(Dimensions.normal)),
          ),
          onPressed: () => Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
          child: Text("Change Theme mode",
              style:
                  textTheme.labelLarge!.copyWith(color: colorScheme.onPrimary)),
        ),
      ],
    );
  }
}

class _TextThemePreview extends StatelessWidget {
  const _TextThemePreview();

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;

    return Column(
      children: [
        Text("Display Large", style: textTheme.displayLarge),
        gapN(),
        Text("Display Medium", style: textTheme.displayMedium),
        gapN(),
        Text("Display Small", style: textTheme.headlineSmall),
        gapN(),
        Text("Headline Large", style: textTheme.headlineLarge),
        gapN(),
        Text("Headline Medium", style: textTheme.headlineMedium),
        gapN(),
        Text("Headline Small", style: textTheme.headlineSmall),
        gapN(),
        Text("Title Large", style: textTheme.titleLarge),
        gapN(),
        Text("Title Medium", style: textTheme.titleMedium),
        gapN(),
        Text("Title Small", style: textTheme.titleSmall),
        gapN(),
        Text("Body Large", style: textTheme.bodyLarge),
        gapN(),
        Text("Body Medium", style: textTheme.bodyMedium),
        gapN(),
        Text("Body Small", style: textTheme.bodySmall),
        gapN(),
        Text("Label Large", style: textTheme.labelLarge),
        gapN(),
        Text("Label Medium", style: textTheme.labelMedium),
        gapN(),
        Text("Label Small", style: textTheme.labelSmall),
        gapN(),
      ],
    );
  }
}
