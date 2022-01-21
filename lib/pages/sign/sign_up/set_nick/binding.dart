import 'package:get/get.dart';

import 'logic.dart';

class SetNickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetNickLogic());
  }
}
