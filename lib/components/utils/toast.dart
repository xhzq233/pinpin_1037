/// pinpin_1037 - toast
/// Created by xhz on 2022/1/17.

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

OverlayState? toastKey;

bool _waringLock = false;

neumorphicToast(String? str, {int delay = 3}) async {
  if (_waringLock || str == null || toastKey == null) return;

  _waringLock = true;

  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (_) => Align(
            alignment: const Alignment(0, 0.69),
            child: Neumorphic(
              style: const NeumorphicStyle(
                  depth: 9, boxShape: NeumorphicBoxShape.stadium()),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                str,
                // style: ThemeFont.body
              ),
            ),
          ));

  toastKey!.insert(_overlayEntry);

  await Future.delayed(Duration(seconds: delay)).then((value) {
    _overlayEntry.remove();
    _waringLock = false;
  });
}
