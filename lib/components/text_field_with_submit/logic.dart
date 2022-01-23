import 'package:get/get.dart';
import 'package:pinpin_1037/utils/validators.dart';

class TextFieldWithSubmitLogic extends GetxController {
  final List<Validator> validators;

  late final List<bool> progress;
  late final List<String> data;

  TextFieldWithSubmitLogic({
    required this.validators,
  }) {
    progress = [for (int i = 0; i < validators.length; i++) false];
    data = [for (int i = 0; i < validators.length; i++) ''];
  }

  void submit() {
    Get.back();
  }

  void updateProgress(int index, bool res) {
    progress[index] = res;

    update();
  }

  void storeData(int index, String str) {
    data[index] = str;
  }
}
