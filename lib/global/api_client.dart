/// pinpin_1037 - api_client
/// Created by xhz on 2022/1/18.

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/models/account/account.dart';
import 'package:pinpin_1037/global/account_mange.dart';
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
      ///不添加其他的，response就是json
      baseUrl: Api.head,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (AccountManager.isLogin) {
        options.headers['Authorization'] =
            'Bearer ' + AccountManager.account!.token;
        log('Auto added token');
      }
      log('REQUEST[${options.method}] => PATH: ${options.path}');
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      log('RESPONSE[${response.statusCode}] '); //=> DATA: ${response.data}
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      final String msg = e.response!.data['msg'];
      final int statusCode = e.response!.statusCode!;
      late final String text;
      if (statusCode == 400) {
        text = '参数错误/不足:$msg';
      } else if (statusCode == 401) {
        text = 'OAuth err:$msg';
      } else if (statusCode == 404) {
        text = '404 page not found';
      } else if (statusCode == 500) {
        text = '操作出错:$msg';
      } else if (statusCode == 504) {
        text = '无应答:$msg';
      } else {
        text = 'Unknown Exception:$msg';
      }
      toast(text);

      ///遇到错误返回空
      return handler.resolve(Response(
          requestOptions: e.requestOptions,
          data: FormData.fromMap({'msg': ''})));
    }));

    return dio;
  }

  static Future<T> next<T>(
    String url, {
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get(
      url,
      cancelToken: cancelToken,
    );

    final responseData = response.data!;
    if (T == PinPinDataSource) {
      return PinPinDataSource.fromJson(responseData[_jsonData]) as T;
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
    final response = await _dio.get(
      target,
      cancelToken: cancelToken,
    );
    final data = PinPinDataSource.fromJson(response.data![_jsonData]);
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
    final response = await _dio.get(
      target,
      cancelToken: cancelToken,
    );
    final data = <PinPinDataSource>[];

    for (dynamic i in response.data![_jsonData]) {
      data.add(PinPinDataSource.fromJson(i));
    }
    return data;
  }

  ///发布拼拼
  static Future<void> postPinPinDataSource(
    PinPinDataSource value,
  ) async {
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
    final response = await _dio.get(
      Api.getPersonalContact,
    );
    final data = PersonContact.fromJson(response.data!);
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
    final response = await _dio.get(
      Api.getPersonalInformation,
    );
    final data = PersonExperience.fromJson(response.data![_jsonData]);
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
    final response = await _dio.get(
      Api.getReply,
      queryParameters: {'PinpinId': id},
      cancelToken: cancelToken,
    );
    final data = PinPinReply.fromJson(response.data![_jsonData]);
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
        data: FormData.fromMap({'PinpinId': id, 'Content': content}));
  }

  ///创建用户
  static Future<void> createAccount({
    required String name,
    required String email,
    required String passwd,
    required int img,
  }) async {
    await _dio.post(Api.createUser, queryParameters: {
      'Email': email,
      'Username': name,
      'Password': passwd,
      'Image': img
    });
  }

  ///发送验证码
  static Future<void> sendCode({
    required String email,
    bool reset = false,
  }) async {
    await _dio.post(Api.sendVerifyCode,
        data: FormData.fromMap({
          'Email': email,
          'IsResetPassword': reset,
        }));
  }

  ///验证验证码
  static Future<void> activateCode({required String code}) async {
    await _dio.post(Api.activateEmail,
        data: FormData.fromMap({'VerifyCode': code}));
  }

  ///登陆
  static Future<Account> login({
    required String email,
    required String passwd,
  }) async {
    final res = await _dio.post(Api.signIn,
        data: FormData.fromMap({
          'Email': email,
          'Password': passwd,
        }));
    final json = res.data!;
    return Account(
        user: json['username'],
        token: json['token'],
        theme: json['image'],
        cache: '',
        locale: '',
        //TODO:locale
        email: email);
  }
}
