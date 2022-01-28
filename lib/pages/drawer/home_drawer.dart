/// pinpin_1037 - home_drawer
/// Created by xhz on 2022/1/23
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/action_sheet.dart';
import 'package:pinpin_1037/components/show_dialog.dart';
import 'package:pinpin_1037/global/account_mange.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_avatar/binding.dart';
import 'package:pinpin_1037/pages/sign/sign_up/set_avatar/view.dart';
import 'package:pinpin_1037/routes/routes.dart';

class HomeDrawerPage extends StatelessWidget {
  const HomeDrawerPage({Key? key}) : super(key: key);

  Widget _component(String title, {void Function()? onTap}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: onTap,
            child: Text(
              title,
              style: ThemeStyle.bodyText1,
            ),
          ),
          const Divider(
            color: Colors.black26,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: ThemeStyle.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DrawerHeader(
                  child: !AccountManager.isLogin
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.welcome + Routes.signIn);
                          },
                          child: const Center(
                            child: Text(
                              "您还未登陆",
                              style: ThemeStyle.headline2,
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final bool? res =
                                    await showNeumorphicBottomDialog(
                                        context: context,
                                        builder: (ctx) =>
                                            actionSheet(title: '设置头像', names: [
                                              '确定',
                                              '取消'
                                            ], actions: [
                                              () => Get.back(result: true),
                                              () => Get.back(result: false),
                                            ]));

                                if (res == true) {
                                  //TODO
                                  final r = await Get.to(
                                    const SetAvatarPage.reset(),
                                    binding: SetAvatarBinding(),
                                  );
                                  if (r == true) {
                                    (context as Element).markNeedsBuild();
                                  }
                                }
                              },
                              child: ClipOval(
                                  child: Image.asset(
                                      'assets/welcome/${AccountManager.account!.theme}.png')),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final bool? res =
                                    await showNeumorphicBottomDialog(
                                  context: context,
                                  builder: (ctx) =>
                                      actionSheet(title: '设置昵称', names: [
                                    '确定',
                                    '取消'
                                  ], actions: [
                                    () => Get.back(result: true),
                                    () => Get.back(result: false),
                                  ]),
                                );

                                if (res == true) {
                                  final r = await Navigator.of(context)
                                      .pushNamed("nick");
                                  if (r == true) {
                                    (context as Element).markNeedsBuild();
                                  }
                                }
                              },
                              child: Center(
                                child: Text(AccountManager.account!.user,
                                    style: ThemeStyle.headline2),
                              ),
                            )
                          ],
                        ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    // itemExtent: 80,
                    children: [
                      _component('消息通知', onTap: () {
                        Get.toNamed(Routes.home + Routes.notice);
                      }),
                      _component('联系方式', onTap: () {
                        Get.toNamed(Routes.home + Routes.contact);
                      }),
                      _component('个人经历', onTap: () {
                        Get.toNamed(Routes.home + Routes.experience);
                      }),
                      _component('我的收藏', onTap: () {
                        Get.toNamed(Routes.home + Routes.collections);
                      }),
                      _component('设置', onTap: () {
                        Get.toNamed(Routes.home + Routes.settings);
                      }),
                    ],
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextButton(
                      onPressed: () async {
                        final bool? res = await showNeumorphicBottomDialog(
                            context: context,
                            builder: (_) =>
                                actionSheet(title: '你确定要退出登录吗', names: [
                                  '确定',
                                  '取消'
                                ], actions: [
                                  () => Get.back(result: true),
                                  () => Get.back(result: false),
                                ]));
                        if (res == true) {
                          AccountManager.removeAccount();
                          Get.offAllNamed(Routes.welcome);
                        }
                      },
                      child: const Text(
                        "退出登录",
                        style: ThemeStyle.headline2,
                      ),
                    ),
                  ),
                  visible: AccountManager.isLogin,
                ),
              ],
            )));
  }
}
