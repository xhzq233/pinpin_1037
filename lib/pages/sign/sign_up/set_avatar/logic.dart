import 'package:get/get.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinpin_1037/routes/routes.dart';

class SetAvatarLogic extends GetxController {
  int avatar = 0;

  void set() async {
    Get.context?.loaderOverlay.show();

    await Future.delayed(const Duration(seconds: 2));

    Get.context?.loaderOverlay.hide();
    Get.offAllNamed(Routes.home);
  }

  void reset() async {
    Get.context?.loaderOverlay.show();

    await Future.delayed(const Duration(seconds: 2));

    Get.context?.loaderOverlay.hide();
    Get.back(result: true);
  }
}
