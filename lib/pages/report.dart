/// pinpin_1037 - report
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinpin_1037/components/text_field_with_submit/view.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/models/global/api_client.dart';
import 'package:pinpin_1037/utils/validators.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
          title: const Text('举报'), leading: littleIconActions()),
      body: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 8,
            child: TextFieldWithSubmitComponent(
              hints: const ['输入举报内容'],
              submitTitle: '确认',
              onSubmit: (data) async {
                context.loaderOverlay.show();
                await ApiClient.reportPinPin(id: id, content: data[0]);
                neumorphicToast('已举办'); //TODO
                context.loaderOverlay.hide();
              },
              obscureTexts: const [false],
              suffixIcons: const [null],
              maxLengths: const [200],
              radius: 15,
              keyboardTypes: const [null],
              validators: const [Validators.isNotEmpty],
              suffixTexts: const [null],
              maxLines: const [1],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
