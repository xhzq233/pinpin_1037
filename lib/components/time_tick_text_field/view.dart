import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/logic.dart';

import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'logic.dart';

class TimeTickTextFieldComponent extends StatelessWidget {
  const TimeTickTextFieldComponent(
      {Key? key,
      required this.hint,
      required this.validator,
      this.onSubmitted,
      this.maxLength,
      this.keyboardType,
      this.obscureText = false,
      this.correctCallback,
      this.stringDataCallback,
      this.timeTick = 60,
      required this.onTapSendCode,
      this.maxLines = 1})
      : super(key: key);

  final void Function(String)? onSubmitted;
  final void Function(String)? stringDataCallback;
  final void Function(bool)? correctCallback;
  final Future<bool> Function() onTapSendCode;
  final int timeTick;
  final String hint;
  final Validator validator;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    ///这里只会put一次
    Get.put(TimeTickLogic(timeTick: timeTick));
    final logic =
        Get.put(NeumorphicTextFieldLogic(validator: validator), tag: hint);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Neumorphic(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              margin: const EdgeInsets.only(top: 5), //TODO:中间部件会乱跑
              style: const NeumorphicStyle(
                depth: -5,
              ),
              child: TextField(
                focusNode: logic.node,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: maxLength,
                maxLines: maxLines,
                controller: logic.controller,
                keyboardType: keyboardType,
                onChanged: (s) {
                  //输入文字时rebuild
                  logic.update();
                  stringDataCallback?.call(logic.controller.text);
                  correctCallback?.call(logic.wrongHint.isEmpty);
                },
                onSubmitted: //提交提示
                    (_) {
                  toast(logic.wrongHint);
                  onSubmitted?.call(_);
                },
                style: ThemeStyle.bodyText1,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: ThemeStyle.bodyText1.copyWith(color: ThemeStyle.captionColor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GetBuilder<TimeTickLogic>(
                assignId: true,
                builder: (logic) => NeumorphicButton(
                  margin: const EdgeInsets.all(10),
                  onPressed: () async {
                    if (logic.status) return;

                    if (await onTapSendCode()) logic.startTick();
                  },
                  child:
                      Text(logic.status ? logic.timeTick.toString() : '获取验证码'),
                ),
              ),
            )
          ],
        ),
        GetBuilder<NeumorphicTextFieldLogic>(
            tag: hint,
            assignId: true,
            builder: (logic) => Visibility(
                  child: Text('*' + logic.wrongHint,
                      style: ThemeStyle.caption
                          .copyWith(color: ThemeStyle.warningColor)),
                  visible: logic.isShowHint, //没有键盘的时候
                ))
      ],
    );
  }
}
