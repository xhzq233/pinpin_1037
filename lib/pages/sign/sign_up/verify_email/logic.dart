import 'package:get/get.dart';

import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/api_client.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

class VerifyEmailLogic extends GetxController {
  String email = Get.parameters['email'] ?? '';
  String code = '';

  bool get isCorrect =>
      Validators.schoolNumber(email).isEmpty &&
      Validators.isNum(code).isEmpty;

  Future<bool> sendCode() async {
    if (Validators.schoolNumber(email).isEmpty) {
      Get.context?.loaderOverlay.show();
      await ApiClient.sendCode(email: email);
      toast('已发送验证码，注意查收');
      Get.context?.loaderOverlay.hide();
      return true;
    }
    toast('邮箱格式错误');
    return false;
  }

  Future<void> submit() async {
    Get.context?.loaderOverlay.show();
    await Future.delayed(const Duration(seconds: 2));
    Get.context?.loaderOverlay.hide();
    Get.toNamed(
        Routes.welcome + Routes.signUp + Routes.nickAndPasswd + '?email=$email');
  }
}
