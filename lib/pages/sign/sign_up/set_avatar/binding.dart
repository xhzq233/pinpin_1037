import 'package:get/get.dart';

import 'logic.dart';

class SetAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetAvatarLogic());
  }
}
