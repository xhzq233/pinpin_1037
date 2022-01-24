/// pinpin_1037 - bottom_dialog
/// Created by xhz on 2022/1/22

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Future<T?> showNeumorphicBottomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: const Color(0x00110000),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Column(
        children: [
          const Spacer(),
          Neumorphic(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            child: builder(context),
          )
        ],
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

Future<T?> showNeumorphicDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  double widthFactor = 0.75,
  double heightFactor = 1 / 5,
  required WidgetBuilder builder,
}) {
  return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: const Color(0x0d110000),
      builder: (BuildContext context) => LayoutBuilder(
          builder: (ctx, layout) => Center(
                child: SizedBox(
                  height: layout.maxHeight * heightFactor,
                  width: layout.maxWidth * widthFactor,
                  child: Neumorphic(
                    child: builder(context),
                  ),
                ),
              )));
}
