/// pinpin_1037 - bottom_dialog
/// Created by xhz on 2022/1/22

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Future<T?> showNeumorphicBottomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: const Color(0x00110000),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          Expanded(
              flex: 1,
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, 1), end: const Offset(0, 0))
                    .animate(animation),
                child: Neumorphic(
                  // style: ThemeNeumorphicStyle.convexCard(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  child: builder(context),
                ),
              ))
        ],
      );
    },
  );
}
