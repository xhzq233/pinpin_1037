/// pinpin_1037 - toast
/// Created by xhz on 2022/1/17.

import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/utils/pair.dart';

toast(String str, {int delay = 3}) async {
  if (str.isEmpty || Get.overlayContext == null) return;

  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (_) => Align(
            alignment: const Alignment(0, 0.69),
            child: Neumorphic(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                str,
                style: const TextStyle(color: ThemeStyle.blue3),
              ),
            ),
          ));
  _Q.query.add(Pair(delay, _overlayEntry));
  if (!_Q.running) _Q.boost();
}

class _Q {
  static List<Pair<int, OverlayEntry>> query = [];
  static bool running = false;

  static void boost() async {
    running = true;
    while (query.isNotEmpty) {
      final i = query.removeAt(0);
      Overlay.of(Get.overlayContext!)!.insert(i.second);
      await Future.delayed(Duration(seconds: i.first));
      i.second.remove();
    }
    running = false;
  }
}
