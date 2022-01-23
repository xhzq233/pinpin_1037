/// pinpin_1037 - main
/// Created by xhz on 2022/1/15.

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/models/global/account_mange.dart';
import 'package:pinpin_1037/pages/home/view.dart';
import 'package:pinpin_1037/pages/welcome/welcome_page.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'components/utils/toast.dart';
import 'i18n/i18n.dart';
import 'i18n/i18n_translations.dart';
import 'models/global/theme.dart';

Locale? _locale; //本地语言
DateTime? _lastPopTime;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AccountManager.init();

  _locale = WidgetsBinding.instance?.window.locale;

  runApp(const App());

  final storageStatus = Permission.storage;

  if (!await storageStatus.isGranted) {
    Permission.storage.request();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
        child: NeumorphicTheme(
            //将NeumorphicTheme向下传递
            theme: ThemeStyle.neumorphicLightTheme,
            darkTheme: ThemeStyle.darkTheme,
            child: GetMaterialApp(
              theme: ThemeStyle.lightTheme,
              translations: I18nTranslations(),
              supportedLocales: const [
                Locale('zh', 'CN'),
                Locale('en', 'US'),
              ],
              locale: _locale,
              fallbackLocale: const Locale('zh', 'CN'),
              debugShowCheckedModeBanner: false,
              title: I18n.title.tr,
              getPages: Routes.routes,
              // navigatorObservers: [routeObserver],
              home: Builder(builder: (ctx) {
                toastKey = Overlay.of(ctx);
                return WillPopScope(
                  onWillPop: () async {
                    if (null == _lastPopTime ||
                        DateTime.now().difference(_lastPopTime!) >
                            const Duration(seconds: 1)) {
                      _lastPopTime = DateTime.now();
                      neumorphicToast(I18n.doubleClickExitHint.tr);
                      return false;
                    } else {
                      return true;
                    }
                  },
                  child:
                      AccountManager.isLogin ? const HomePage() : const WelcomePage(),
                );
              }),
              enableLog: false,
            )));
  }
}
