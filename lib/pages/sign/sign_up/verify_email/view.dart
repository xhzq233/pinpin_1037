import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';
import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/time_tick_text_field/view.dart';
import 'package:pinpin_1037/components/utils/page_padding_wrapper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'logic.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<VerifyEmailLogic>();
    return Scaffold(
        appBar: NeumorphicAppBar(
            title: const Text(
              '注册拼拼',
              style: ThemeStyle.headline1,
            ),
            leading: littleIconActions()),
        body: pagePaddingWrap(
            child: Column(
              children: [
                NeumorphicTextFieldComponent(
                  initData: logic.email,
                  hint: '输入邮箱',
                  suffixText: '@hust.edu.cn',
                  radius: 15,
                  validator: Validators.schoolNumber,
                  stringDataCallback: (str) {
                    logic.email = str;
                    logic.update();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TimeTickTextFieldComponent(
                  hint: '输入验证码',
                  onTapSendCode: logic.sendCode,
                  validator: Validators.isNum,
                  stringDataCallback: (str) {
                    logic.code = str;
                    logic.update();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "忘记密码",
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.welcome + Routes.signIn,
                              parameters: {'email': logic.email});
                        },
                        child: const Text(
                          "已经注册？",
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<VerifyEmailLogic>(
                  assignId: true,
                  builder: (logic) => submitButton(logic.isCorrect,
                      onSubmit: logic.submit, text: '注册'),
                ),
                const Spacer(),
              ],
            )),);
  }
}
