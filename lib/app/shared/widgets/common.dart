import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

import '../constants/dimens.dart';

Widget gapF(double factor) => Gap(Dimensions.normal * factor); // gap with factor
Widget gapN() => const Gap(Dimensions.normal); // gap normal
Widget gapS() => const Gap(Dimensions.small); // gap small
Widget gapL() => const Gap(Dimensions.large); // gap large

Widget divider4B() {
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return Divider(height: 4, color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4));
}
