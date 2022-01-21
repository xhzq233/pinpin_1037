import 'package:get/get.dart';

import 'logic.dart';

class HomeDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeDrawerLogic());
  }
}
