import 'package:get/get.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pinpin_1037/utils/validators.dart';

class NeumorphicTextFieldLogic extends GetxController {
  final TextEditingController controller = TextEditingController();
  final FocusNode node = FocusNode();

  String get wrongHint => validator(controller.text);

  ///没有初始文本，没有错误提示，键盘收起情况下为真
  bool get isShowHint =>
      controller.text.isNotEmpty && wrongHint.isNotEmpty && !node.hasFocus;

  final Validator validator;

  NeumorphicTextFieldLogic({required this.validator}) {
    node.addListener(() {
      if (!node.hasFocus) {
        //当键盘消失时，再rebuild一遍
        update();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    node.dispose();
    super.dispose();
  }
}
