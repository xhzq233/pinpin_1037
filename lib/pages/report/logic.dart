import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/api_client.dart';

class ReportLogic extends GetxController {
  String content = '';

  bool get isCorrect => content.isNotEmpty;

  Future<void> report(int id) async {
    Get.context?.loaderOverlay.show();
    await ApiClient.reportPinPin(id: id, content: content);
    toast('已举办');
    Get.context?.loaderOverlay.hide();
    Get.back();
  }
}
