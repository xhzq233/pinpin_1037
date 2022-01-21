import 'package:get/get.dart';

import 'logic.dart';

class PostPinPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostPinPinLogic());
  }
}
