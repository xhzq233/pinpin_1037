/// pinpin_1037 - api_client
/// Created by xhz on 2022/1/18.

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/models/person_contact/person_contact.dart';
import 'package:pinpin_1037/models/person_experience/person_experience.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/models/pin_pin_reply/pin_pin_reply.dart';

import 'api.dart';

class ApiClient {
  static final Dio _dio = createDio();
  static const _jsonData = 'msg';

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Api.head,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      log('REQUEST[${options.method}] => PATH: ${options.path}');
      // Do something before request is sent
      return handler.next(options); //continue
      // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (response, handler) {
      log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      log(response.data.toString());
      // Do something with response data
      return handler.next(response); // continue
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      neumorphicToast(e.message);
      // Do something with response error
      return handler.next(e); //continue
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    }));

    return dio;
  }

  static Future<T> next<T>(
    String url, {
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get<String>(
      url,
      cancelToken: cancelToken,
    );

    final responseData = response.data!;
    if (T == PinPinDataSource) {
      return PinPinDataSource.fromJson(jsonDecode(responseData)) as T;
    }
    throw Exception('type cast err');
  }

  ///获取PinPinDataSource
  ///可选择target 有：
  ///[Api.getPinPinData]
  ///[Api.getPersonalPinPin]
  ///[Api.getFollows]
  static Future<PinPinDataSource> getPinPinDataSource({
    String target = Api.getPinPinData,
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get<String>(
      target,
      cancelToken: cancelToken,
    );
    final data =
        PinPinDataSource.fromJson(jsonDecode(response.data!)[_jsonData]);
    return data;
  }

  ///获取PinPinDataSource
  ///可选择target 有：
  ///[Api.getPinPinData]
  ///[Api.getPersonalPinPin]
  ///[Api.getFollows]
  static Future<List<PinPinDataSource>> getPinPinDataSourceList({
    String target = Api.getPinPinData,
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get<String>(
      target,
      cancelToken: cancelToken,
    );
    final data = <PinPinDataSource>[];

    for (dynamic i in jsonDecode(response.data!)[_jsonData]) {
      data.add(PinPinDataSource.fromJson(i));
    }
    return data;
  }

  ///发布拼拼
  static Future<void> postPinPinDataSource({
    required PinPinDataSource value,
  }) async {
    await _dio.post(Api.createPinPin, data: jsonEncode(value.toJson()));
  }

  ///更新拼拼
  static Future<void> updatePinPinDataSource({
    required PinPinDataSource newValue,
  }) async {
    await _dio.put(Api.updatePinPin, data: jsonEncode(newValue.toJson()));
  }

  ///更新拼拼人数
  static Future<void> updatePinPinDemandingNumber({
    required int newNow,
    required int newDemand,
    required int id,
  }) async {
    await _dio.put(Api.updateRecruitNumber,
        data: FormData.fromMap(
          {
            'PinpinId': id,
            'Demanding_num': newDemand,
            'Now_num': newNow,
          },
        ));
  }

  ///删除拼拼
  static Future<void> deletePinPin({
    required int id,
  }) async {
    await _dio.delete(Api.deletePinPin,
        queryParameters: {
          'PinpinId': id,
        },
        data: FormData.fromMap(
          {
            'PinpinId': id,
          },
        ));
  }

  ///获取个人联系方式
  static Future<PersonContact> getPersonContact() async {
    final response = await _dio.get<String>(
      Api.getPersonalContact,
    );
    final data = PersonContact.fromJson(jsonDecode(response.data!)[_jsonData]);
    return data;
  }

  ///更新个人联系方式
  static Future<void> updatePersonContact({
    required PersonContact newValue,
  }) async {
    await _dio.put(
      Api.changePersonalContact,
      data: jsonEncode(newValue.toJson()),
    );
  }

  ///获取个人经历
  static Future<PersonExperience> getPersonExp() async {
    final response = await _dio.get<String>(
      Api.getPersonalInformation,
    );
    final data =
        PersonExperience.fromJson(jsonDecode(response.data!)[_jsonData]);
    return data;
  }

  ///更新个人经历
  static Future<void> updatePersonExp({
    required PersonExperience newValue,
  }) async {
    await _dio.put(
      Api.changePersonalExp,
      data: jsonEncode(newValue.toJson()),
    );
  }

  ///获取特定id的pinpin贴下的评论
  static Future<PinPinReply> getPinPinReply({
    required int id,
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get<String>(
      Api.getReply,
      queryParameters: {'PinpinId': id},
      cancelToken: cancelToken,
    );
    final data = PinPinReply.fromJson(jsonDecode(response.data!)[_jsonData]);
    return data;
  }

  ///评论
  static Future<void> postPinPinReply({
    required int id,
    required int replyTo,
    required String content,
  }) async {
    await _dio.post(Api.replyPinPin, queryParameters: {
      'Content': content,
      'PinpinId': id,
      'ReplyTo': replyTo
    });
  }

  ///删除评论
  static Future<void> deleteReply({
    required int id,
    required int replyId,
  }) async {
    await _dio.delete(Api.deleteReply,
        queryParameters: {'PinpinId': id, 'ReplyId': replyId});
  }

  ///更改头像
  static Future<void> changeAvatar(
      {required String email, required int imgID}) async {
    await _dio.put(Api.changeAvatar,
        queryParameters: {'Email': email, 'NewImage': imgID + 1});
  }

  ///更改昵称
  static Future<void> changeNick(
      {required String email, required String name}) async {
    await _dio.put(Api.changeUsername,
        queryParameters: {'Email': email, 'NewUsername': name});
  }

  ///收藏拼拼
  static Future<void> bookmarkPinPin({required int id}) async {
    await _dio.post(Api.followPinPin, queryParameters: {'PinpinId': id});
  }

  ///举办拼拼
  static Future<void> reportPinPin(
      {required int id, required String content}) async {
    await _dio.post(Api.reportPinPin,
        queryParameters: {'PinpinId': id, 'Content': content});
  }
}
