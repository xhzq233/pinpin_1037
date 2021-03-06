/// pinpin_1037 - welcome_page
/// Created by xhz on 2022/1/17.

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/utils/page_padding_wrapper.dart';
import 'package:pinpin_1037/i18n/i18n.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NeumorphicApp;
    return Scaffold(
        body: pagePaddingWrap(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(
          flex: 15,
        ),
        Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  I18n.welcome.tr,
                  style: const TextStyle(
                      color: ThemeStyle.blue1,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/welcome/wel_t.png'),
              ],
            )),
        Expanded(
          flex: 30,
          child: Image.asset('assets/welcome/wel.png'),
        ),
        Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeumorphicButton(
                    style: NeumorphicTheme.of(context)
                        ?.current
                        ?.buttonStyle
                        ?.copyWith(color: ThemeStyle.blue1),
                    onPressed: () {
                      Get.toNamed(Routes.welcome + Routes.signIn);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          I18n.join.tr,
                          style: ThemeStyle.headline2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )),
                NeumorphicButton(
                    // style: ,
                    onPressed: () {
                      Get.offAllNamed(Routes.home);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          I18n.takeALook.tr,
                          style: ThemeStyle.headline2
                              .copyWith(color: ThemeStyle.blue1),
                        ),
                      ),
                    )),
              ],
            )),
        const Spacer(
          flex: 5,
        ),
      ],
    )));
  }
}
