/// pinpin_1037 - submit_button
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pinpin_1037/global/theme.dart';

Widget submitButton(bool isCorrect,
        {required void Function() onSubmit,
        required String text,
        void Function()? onLose}) =>
    NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 12),
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: 6,
          boxShape: const NeumorphicBoxShape.stadium(),
          color: isCorrect
              ? ThemeStyle.publishPinpinColor
              : ThemeStyle.buttonBannedColor),
      onPressed: () {
        if (isCorrect) {
          onSubmit();
        } else if (onLose != null) {
          onLose();
        }
      },
      child: Center(
        child: Text(
          text,
          style: ThemeStyle.headline2,
        ),
      ),
    );
