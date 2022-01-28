/// pinpin_1037 - action_sheet
/// Created by xhz on 2022/1/22

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pinpin_1037/global/theme.dart';

Widget actionSheet(
    {String? title,
    required List<String> names,
    required List<void Function()> actions}) {
  assert(names.length == actions.length);
  assert(names.isNotEmpty);

  return Column(children: [
    if (title != null)
      Text(
        title,
        style: ThemeStyle.headline2,
      ),
    for (int i = 0; i < names.length; i++)
      Card(
        child: ListTile(
          onTap: actions[i],
          title: Text(
            names[i],
            style: ThemeStyle.headline2,
          ),
        ),
      ),
  ]);
}
