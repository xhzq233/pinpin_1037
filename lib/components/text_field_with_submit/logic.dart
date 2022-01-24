import 'package:get/get.dart';
import 'package:pinpin_1037/utils/validators.dart';

class TextFieldWithSubmitLogic extends GetxController {
  final List<Validator> validators;

  late final List<bool> progress = [
    for (int i = 0; i < validators.length; i++) false
  ];

  late final List<String> data = [
    for (int i = 0; i < validators.length; i++) ''
  ];

  TextFieldWithSubmitLogic({
    required this.validators,
  });

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
