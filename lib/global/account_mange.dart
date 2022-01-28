/// pinpin_1037 - account
/// Created by xhz on 2022/1/17.

import 'dart:convert';
import 'package:pinpin_1037/models/account/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountManager {
  static bool get isLogin => account != null;
  static Account? account;
  static const _localSaveName = 'account';

  //初始化
  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_localSaveName)) {
      account = Account.fromJson(jsonDecode(prefs.getString(_localSaveName)!));
    }
  }

  static Future<void> saveAccount(Account profile) async {
    account = profile;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_localSaveName, jsonEncode(profile.toJson()));
  }

  static Future<void> removeAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    account = null;
    prefs.remove(_localSaveName);
  }
}
