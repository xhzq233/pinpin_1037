import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'logic.dart';

class NeumorphicTextFieldComponent extends StatelessWidget {
  const NeumorphicTextFieldComponent(
      {Key? key,
      required this.hint,
      required this.validator,
      this.radius,
      this.onSubmitted,
      this.maxLength,
      this.keyboardType,
      this.suffixIcon,
      this.suffixText,
      this.obscureText = false,
      this.correctCallback,
      this.stringDataCallback,
      this.initData,
      this.maxLines = 1})
      : super(key: key);

  final void Function(String)? onSubmitted;
  final void Function(String)? stringDataCallback;
  final void Function(bool)? correctCallback;
  final String hint;
  final Validator validator;
  final double? radius;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final String? suffixText;
  final bool obscureText;
  final int? maxLines;
  final String? initData;

  @override
  Widget build(BuildContext context) {
    ///这里只会put一次
    final logic = Get.put(
        NeumorphicTextFieldLogic(validator: validator, initData: initData),
        tag: hint + stringDataCallback.hashCode.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Neumorphic(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          margin: const EdgeInsets.only(top: 5),
          style: NeumorphicStyle(
            depth: -5,
            boxShape: radius == null
                ? const NeumorphicBoxShape.stadium()
                : NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(radius!))),
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
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: ThemeStyle.bodyText1.copyWith(color: ThemeStyle.captionColor),
            ),
          ),
        ),
        GetBuilder<NeumorphicTextFieldLogic>(
            tag: hint + stringDataCallback.hashCode.toString(),
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
