import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinpin_1037/global/api.dart';
import 'package:pinpin_1037/global/api_client.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';

class HomeLogic extends GetxController {
  bool isShowFilterBar = false;

  void showOrHideFilterBar() {
    isShowFilterBar = !isShowFilterBar;
    update();
  }
}

///分别管理data和页面逻辑
class HomeDataLogic extends GetxController {
  static const all = true;
  static const onlyMe = false;
  final controller = PageController();
  bool currentTab = all;

  Future<List<PinPinDataSource>> get data async =>
      await ApiClient.getPinPinDataSourceList(
          target: currentTab ? Api.getPinPinData : Api.getPersonalPinPin,
          cancelToken: CancelToken());

  void changeCurrentTab(bool c) {
    currentTab = c;
    controller.jumpToPage(c ? 0 : 1);
  }
}
