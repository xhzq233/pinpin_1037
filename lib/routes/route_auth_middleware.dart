/// pinpin_1037 - route_auth_middleware
/// Created by xhz on 2022/1/17.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/i18n/i18n.dart';
import 'package:pinpin_1037/global/account_mange.dart';
import 'package:pinpin_1037/routes/routes.dart';

class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware({required int? priority}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    if (AccountManager.isLogin) {
      return null;
    }
    Get.snackbar(I18n.notice.tr, "请先登录APP");

    return const RouteSettings(name: Routes.welcome + Routes.signIn);
  }
}
