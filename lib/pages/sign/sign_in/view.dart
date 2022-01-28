import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';

import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/utils/page_padding_wrapper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:pinpin_1037/utils/validators.dart';

import 'logic.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SignInLogic>();
    return Scaffold(
      appBar: NeumorphicAppBar(
          title: const Text(
            '登录拼拼',
            style: ThemeStyle.headline1,
          ),
          leading: littleIconActions()),
      body: pagePaddingWrap(
          child: Column(
            children: [
              NeumorphicTextFieldComponent(
                initData: logic.email,
                hint: '输入学号',
                suffixText: '@hust.edu.cn',
                validator: Validators.schoolNumber,
                radius: 15,
                stringDataCallback: (str) {
                  logic.email = str;
                  logic.update();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              NeumorphicTextFieldComponent(
                hint: '输入密码',
                obscureText: true,
                validator: Validators.passwd,
                radius: 15,
                stringDataCallback: (str) {
                  logic.passwd = str;
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
                      onTap: () => Get.offNamed(Routes.welcome + Routes.signUp,
                          parameters: {'email': logic.email}),
                      child: const Text(
                        "还未注册？",
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SignInLogic>(
                assignId: true,
                builder: (logic) => submitButton(logic.isCorrect,
                    onSubmit: logic.login, text: '登录'),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
