import 'package:get/get.dart';

import 'logic.dart';

class CollectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionsLogic());
  }
}
