import 'package:get/get.dart';

import 'package:pinpin_1037/global/account_mange.dart';
import 'package:pinpin_1037/global/api_client.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInLogic extends GetxController {
  String email = Get.parameters['email'] ?? '';
  String passwd = '';

  bool get isCorrect =>
      Validators.schoolNumber(email).isEmpty &&
      Validators.passwd(passwd).isEmpty;

  void login() async {
    Get.context?.loaderOverlay.show();
    final account = await ApiClient.login(email: email, passwd: passwd);

    await AccountManager.saveAccount(account);
    Get.context?.loaderOverlay.hide();
    Get.offAllNamed(Routes.home);
  }
}
