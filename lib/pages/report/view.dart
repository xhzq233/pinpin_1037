/// pinpin_1037 - report
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';
import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/utils/page_padding_wrapper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/pages/report/logic.dart';
import 'package:pinpin_1037/utils/validators.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ReportLogic>();
    return Scaffold(
        appBar: NeumorphicAppBar(
            title: const Text(
              '举报',
              style: ThemeStyle.headline1,
            ),
            leading: littleIconActions()),
        body: pagePaddingWrap(
            child: Column(
          children: [
            NeumorphicTextFieldComponent(
              hint: '输入举报内容',
              maxLength: 200,
              radius: 15,
              validator: Validators.schoolNumber,
              stringDataCallback: (str) {
                logic.content = str;
                logic.update();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<ReportLogic>(
              assignId: true,
              builder: (logic) => submitButton(logic.isCorrect,
                  onSubmit: () => logic.report(id), text: '确认'),
            ),
            const Spacer(),
          ],
        )));
  }
}
