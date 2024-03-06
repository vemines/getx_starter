import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/app/shared/constants/dimens.dart';
import 'package:getx_starter/app/shared/constants/values.dart';
import 'package:getx_starter/app/shared/extensions/string_extension.dart';

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
    var colorTheme = context.theme.colorScheme;
    var colorExtTheme = context.theme.extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        title: Text("Preview", style: textTheme.headlineMedium!.copyWith(color: colorTheme.onPrimary)),
        centerTitle: true,
        backgroundColor: colorTheme.primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(Dimensions.normal),
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset("assets/jpg/sample.jpeg".prefixAssets()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(Dimensions.normal)),
                  ),
                  onPressed: () => Get.toNamed(Routes.posts),
                  child: Text("Go Post Page", style: textTheme.labelLarge!.copyWith(color: colorTheme.onPrimary)),
                ),
              ],
            ),
            TextThemePreview(textTheme: textTheme),
            gapL(),
            _ColorPreview(
              colorTheme: colorTheme,
              colorExtTheme: colorExtTheme.colorTheme,
              textTheme: textTheme,
            ),
            gapL(),
            _TranslatePreview(textTheme: textTheme, colorTheme: colorTheme),
          ],
        ),
      ),
    );
  }
}

class _TranslatePreview extends StatefulWidget {
  const _TranslatePreview({required this.textTheme, required this.colorTheme});
  final TextTheme textTheme;
  final ColorScheme colorTheme;

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
    return Column(
      children: [
        Text("Normal Text", style: widget.textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.hello.tr, style: widget.textTheme.bodyLarge),
        gapN(),
        Text("Param Text", style: widget.textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.param.trParams({"param": "VeMines"}), style: widget.textTheme.bodyLarge),
        gapN(),
        Text("Nested Text", style: widget.textTheme.headlineSmall),
        gapS(),
        Text(LocaleKeys.nestedKey1.tr, style: widget.textTheme.bodyLarge),
        gapN(),
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusBorder.normal),
            color: widget.colorTheme.surface,
          ),
          child: DropdownButton<String>(
            iconSize: 30,
            isExpanded: true,
            borderRadius: BorderRadius.circular(RadiusBorder.normal),
            focusColor: widget.colorTheme.surface,
            dropdownColor: widget.colorTheme.surface,
            underline: const DropdownButtonHideUnderline(child: SizedBox()),
            value: currentLanguage,
            items: supportLanguages.entries.map((entry) {
              return DropdownMenuItem<String>(
                value: entry.key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key, style: widget.textTheme.bodyLarge),
                    Text(entry.value, style: widget.textTheme.bodyLarge),
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

class _ColorPreview extends StatelessWidget {
  const _ColorPreview({
    required this.colorExtTheme,
    required this.textTheme,
    required this.colorTheme,
  });
  final ColorThemeExt colorExtTheme;
  final TextTheme textTheme;
  final ColorScheme colorTheme;

  Widget _buildColor(String name, Color color) => SizedBox(
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: Dimensions.normal,
          spacing: Dimensions.normal,
          children: [
            _buildColor("Info (theme extends)", colorExtTheme.info),
            _buildColor("Warning (theme extends)", colorExtTheme.warning),
            _buildColor("Success (theme extends)", colorExtTheme.success),
          ],
        ),
        gapN(),
        FilledButton(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(Dimensions.normal)),
          ),
          onPressed: () => Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
          child: Text("Change Theme mode", style: textTheme.labelLarge!.copyWith(color: colorTheme.onPrimary)),
        ),
      ],
    );
  }
}

class TextThemePreview extends StatelessWidget {
  const TextThemePreview({required this.textTheme, super.key});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
