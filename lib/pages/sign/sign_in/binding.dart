import 'package:get/get.dart';

import 'logic.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInLogic());
  }
}
