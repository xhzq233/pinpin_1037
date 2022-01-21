import 'package:get/get.dart';

import 'logic.dart';

class SetPasswdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetPasswdLogic());
  }
}
