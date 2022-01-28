import 'package:get/get.dart';

import 'package:pinpin_1037/routes/routes.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SetNickLogic extends GetxController {
  final email = Get.parameters['email'];

  String nick = '';
  String passwd = '';

  bool get isCorrect => nick.isNotEmpty && Validators.passwd(passwd).isEmpty;

  Future<void> submit() async {
    Get.context?.loaderOverlay.show();
    await Future.delayed(const Duration(seconds: 2));
    Get.context?.loaderOverlay.hide();
    Get.toNamed(Routes.welcome +
        Routes.signUp +
        Routes.nickAndPasswd +
        Routes.avatar +
        '?email=$email&nick=$nick&nick=$passwd');
  }
}
