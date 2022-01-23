import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';
import 'package:pinpin_1037/utils/validators.dart';
import '../submit_button.dart';
import 'logic.dart';

///多个text field 并上submitButton的部件
class TextFieldWithSubmitComponent extends StatelessWidget {
  const TextFieldWithSubmitComponent(
      {Key? key,
      required this.validators,
      required this.hints,
      required this.onSubmit,
      this.midChild,
      this.radius,
      required this.maxLengths,
      required this.keyboardTypes,
      required this.suffixIcons,
      required this.suffixTexts,
      required this.obscureTexts,
      required this.maxLines,
      this.submitTitle = '下一步'})
      : assert(validators.length == hints.length),
        assert(hints.length == maxLengths.length),
        assert(maxLengths.length == keyboardTypes.length),
        assert(keyboardTypes.length == suffixIcons.length),
        assert(suffixIcons.length == obscureTexts.length),
        assert(obscureTexts.length == maxLines.length),
        super(key: key);

  final List<String> hints;
  final List<Validator> validators;
  final List<int?> maxLengths;
  final List<TextInputType?> keyboardTypes;
  final List<Icon?> suffixIcons;
  final List<String?> suffixTexts;
  final List<bool> obscureTexts;
  final List<int?> maxLines;

  final void Function(List<String>) onSubmit;
  final Widget? midChild; //传进来的不会rebuild
  final double? radius; //共用的radius
  final String submitTitle;

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TextFieldWithSubmitLogic(validators: validators));

    return Column(
      children: [
        for (int i = 0; i < hints.length; i++)
          Expanded(
              child: NeumorphicTextFieldComponent(
            validator: validators[i],
            hint: hints[i],
            keyboardType: keyboardTypes[i],
            suffixIcon: suffixIcons[i],
            suffixText: suffixTexts[i],
            maxLines: maxLines[i],
            maxLength: maxLengths[i],
            radius: radius,
            obscureText: obscureTexts[i],
            correctCallback: (res) => logic.updateProgress(i, res),
            stringDataCallback: (str) => logic.storeData(i, str),
          )),
        if (midChild != null) midChild!,
        GetBuilder<TextFieldWithSubmitLogic>(
            builder: (logic) => submitButton(
                    logic.progress.every((element) => element), //只有所有为ture才ture
                    onSubmit: () {
                  onSubmit(logic.data);
                  logic.submit();
                }, text: submitTitle))
      ],
    );
  }
}
