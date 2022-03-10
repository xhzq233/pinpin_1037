/// pinpin_1037 - toast
/// Created by xhz on 2022/1/17.

import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/utils/pair.dart';

toast(String str, {int delay = 3}) {
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
  ToastQueue.push(Pair(delay, _overlayEntry));
}

typedef ToastQueueValue = Pair<int, OverlayEntry>;

class ToastQueue {
  static final List<ToastQueueValue> _queue = [];
  static bool _isRunning = false;

  static void push(ToastQueueValue value) {
    _queue.add(value);
    if (!_isRunning) _boost();
  }

  static void _boost() async {
    _isRunning = true;
    while (_queue.isNotEmpty) {
      final i = _queue.removeAt(0);
      Overlay.of(Get.overlayContext!)!.insert(i.second);
      await Future.delayed(Duration(seconds: i.first));
      i.second.remove();
    }
    _isRunning = false;
  }
}