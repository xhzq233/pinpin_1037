import 'package:get/get.dart';

import 'logic.dart';

class ExperienceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExperienceLogic());
  }
}
