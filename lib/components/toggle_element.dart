/// pinpin_1037 - toggle_element
/// Created by xhz on 2022/1/24

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pinpin_1037/models/global/theme.dart';

ToggleElement toggleElement({
  required String str,
}) =>
    ToggleElement(
      background: Center(
          child: Text(
        str,
        style: ThemeStyle.bodyText1,
      )),
      foreground: Center(
          child: Text(
        str,
        style: ThemeStyle.bodyText1.copyWith(fontWeight: FontWeight.bold),
      )),
    );
