import '../constants/dimens.dart';
import '../widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ListGutter on List<Widget> {
  List<Widget> separateCenter([double space = Dimensions.normal, bool divider = false]) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) => [...r, Gap(space), divider ? divider4B() : const SizedBox(), element],
        );

  List<Widget> separateAll([double space = Dimensions.normal]) {
    if (length <= 1) return this;

    var centerList = sublist(1, length - 1).map((element) => [Gap(space), element]).expand((e) => e).toList();

    return [Gap(space), first, ...centerList, last, Gap(space)];
  }
}
