/// pinpin_1037 - pinpin_list_source
/// Created by xhz on 2022/1/23

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pinpin_1037/global/api.dart';
import 'package:pinpin_1037/global/api_client.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';

enum DataType {
  totalPinPin,
  personalPinPin,
  followedPinPin,
}

class PinPinListSource extends LoadingMoreBase<PinPinDataSource> {
  bool firstInit = true; //第一次加载数据

  bool forceRefresh = false;
  CancelToken cancelToken = CancelToken();

  DataType dataType;

  String get api {
    switch (dataType) {
      case DataType.totalPinPin:
        return Api.getPinPinData;
      case DataType.personalPinPin:
        return Api.getPersonalPinPin;
      case DataType.followedPinPin:
        return Api.getFollows;
    }
  }

  PinPinListSource({required this.dataType});

  @override
  bool get hasMore => firstInit;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    firstInit = true;

    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    try {
      final source = await ApiClient.getPinPinDataSourceList(
          target: api, cancelToken: cancelToken);
      if (firstInit) {
        clear();
        firstInit = false; //init完毕
        addAll(source);
      } else {
        if (hasMore) addAll(source);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    cancelToken.cancel();
    super.dispose();
  }
}
