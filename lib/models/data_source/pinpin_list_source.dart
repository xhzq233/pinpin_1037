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
  int pageindex = 1;
  bool _hasMore = true;
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
  bool get hasMore => (_hasMore && length < 30) || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    pageindex = 1;

    //force to refresh list when you don't want clear list before request

    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      final source = await ApiClient.getPinPinDataSourceList(
          target: api, cancelToken: cancelToken);
      if (pageindex++ == 1) {
        clear();
      }
      if (hasMore) addAll(source);

      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      log(exception.toString());
      log(stack.toString());
    }
    return isSuccess;
  }

  @override
  void dispose() {
    cancelToken.cancel();
    super.dispose();
  }
}
