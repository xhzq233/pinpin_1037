import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';
import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/utils/page_padding_wrapper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'logic.dart';

class SetNickPage extends StatelessWidget {
  const SetNickPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SetNickLogic>();

    return Scaffold(
      appBar: NeumorphicAppBar(
          title: const Text('设置用户名和密码'), leading: littleIconActions()),
      body: pagePaddingWrap(
          child: Column(
        children: [
          NeumorphicTextFieldComponent(
            hint: '输入用户名',
            radius: 15,
            validator: Validators.isNotEmpty,
            stringDataCallback: (str) {
              logic.nick = str;
              logic.update();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          NeumorphicTextFieldComponent(
            hint: '输入密码',
            radius: 15,
            validator: Validators.passwd,
            obscureText: true,
            stringDataCallback: (str) {
              logic.passwd = str;
              logic.update();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<SetNickLogic>(
            assignId: true,
            builder: (logic) => submitButton(logic.isCorrect,
                onSubmit: logic.submit, text: '下一步'),
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
