import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pinpin_1037/pages/drawer/collections/binding.dart';
import 'package:pinpin_1037/pages/drawer/collections/view.dart';
import 'package:pinpin_1037/pages/drawer/contact/binding.dart';
import 'package:pinpin_1037/pages/drawer/contact/view.dart';
import 'package:pinpin_1037/pages/drawer/experience/binding.dart';
import 'package:pinpin_1037/pages/drawer/experience/view.dart';
import 'package:pinpin_1037/pages/drawer/notice/binding.dart';
import 'package:pinpin_1037/pages/drawer/notice/view.dart';
import 'package:pinpin_1037/pages/drawer/settings/binding.dart';
import 'package:pinpin_1037/pages/drawer/settings/view.dart';
import 'package:pinpin_1037/pages/home/binding.dart';
import 'package:pinpin_1037/pages/home/view.dart';
import 'package:pinpin_1037/pages/post_pin_pin/binding.dart';
import 'package:pinpin_1037/pages/post_pin_pin/view.dart';
import 'package:pinpin_1037/pages/sign/sign_in/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_in/view.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_avatar/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_avatar/view.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_nick/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_nick/view.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_passwd/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_passwd/view.dart';
import 'package:pinpin_1037/pages/sign/sign_up/verify_email/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_up/verify_email/view.dart';
import 'package:pinpin_1037/pages/welcome/welcome_page.dart';
import 'package:pinpin_1037/routes/route_auth_middleware.dart';

//监听路由堆栈的变化
// RouteObserver<ModalRoute<void>> routeObserver =
//     RouteObserver<ModalRoute<void>>();

class Routes {
  ///主页
  static const home = "/home";
  static const postPinPin = "/post";

  ///登陆
  static const welcome = "/welcome";
  static const signUp = "/sign_up"; //验证邮箱VerifyEmail
  static const signIn = "/sign_in";
  static const avatar = "/avatar";
  static const nick = "/nick";
  static const passwd = "/passwd";

  ///抽屉 drawer
  static const notice = "/notice";
  static const experience = "/experience";
  static const contact = "/contact";
  static const collections = "/collections";
  static const settings = "/post";

  ///not found
  static const notFound = '/notFound';

  static final routes = [
    GetPage(
        name: home,
        page: () => HomePage(),
        binding: HomeBinding(),
        middlewares: [
          RouteAuthMiddleware(priority: 1)
        ],
        children: [
          GetPage(
              name: postPinPin,
              page: () => PostPinPinPage(),
              binding: PostPinPinBinding()),
          GetPage(
              name: notice, page: () => NoticePage(), binding: NoticeBinding()),
          GetPage(
              name: experience,
              page: () => ExperiencePage(),
              binding: ExperienceBinding()),
          GetPage(
              name: contact,
              page: () => ContactPage(),
              binding: ContactBinding()),
          GetPage(
              name: collections,
              page: () => CollectionsPage(),
              binding: CollectionsBinding()),
          GetPage(
              name: settings,
              page: () => SettingsPage(),
              binding: SettingsBinding()),
        ]),
    GetPage(name: welcome, page: () => const WelcomePage(), children: [
      GetPage(name: signIn, page: () => SignInPage(), binding: SignInBinding()),
      GetPage(
          name: signUp,
          page: () => VerifyEmailPage(),
          binding: VerifyEmailBinding(),
          children: [
            GetPage(
                name: passwd,
                page: () => SetPasswdPage(),
                binding: SetPasswdBinding(),
                children: [
                  GetPage(
                      name: nick,
                      page: () => SetNickPage(),
                      binding: SetNickBinding(),
                      children: [
                        GetPage(
                            name: avatar,
                            binding: SetAvatarBinding(),
                            page: () => SetAvatarPage()),
                      ]),
                ]),
          ]),
    ]),
  ];
}
