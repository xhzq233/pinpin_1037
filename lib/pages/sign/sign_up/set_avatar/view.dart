import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/swiper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/global/theme.dart';

import 'logic.dart';

class SetAvatarPage extends StatelessWidget {
  const SetAvatarPage({Key? key})
      : isReset = false,
        super(key: key);
  final bool isReset;

  const SetAvatarPage.reset({Key? key})
      : isReset = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SetAvatarLogic>();
    return Scaffold(
      appBar: NeumorphicAppBar(leading: littleIconActions()),
      body: Column(children: [
        const Text(
          "选择头像",
          style: ThemeStyle.headline1,
        ),
        Expanded(
            flex: 5,
            child: Swiper(
              onChange: (i) {
                logic.avatar = i;
              },
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/welcome/1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset('assets/welcome/2.png', fit: BoxFit.contain),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset('assets/welcome/3.png', fit: BoxFit.contain),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset('assets/welcome/4.png', fit: BoxFit.contain),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset('assets/welcome/5.png', fit: BoxFit.contain),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset('assets/welcome/6.png', fit: BoxFit.contain),
                ),
              ],
            )),
        const Spacer(),
        SizedBox(
          width: Get.width * 0.8,
          child: submitButton(true, onSubmit: () {
            if (isReset) {
              logic.reset();
            } else {
              logic.set();
            }
          }, text: '确认'),
        ),
        const Spacer(
          flex: 5,
        )
      ]),
    );
  }
}
