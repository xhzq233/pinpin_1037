import 'dart:async';
import 'package:get/get.dart';


class TimeTickLogic extends GetxController {
  int timeTick;

  TimeTickLogic({required this.timeTick});

  static const timeTickStart = true;
  static const timeTickEnd = false;

  bool status = timeTickEnd;

  void startTick() {
    status = timeTickStart;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeTick--;
      update();
      if (timeTick == 0) {
        status = timeTickEnd;
        timer.cancel();
      }
    });
  }
}
