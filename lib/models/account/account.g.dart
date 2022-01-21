// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      user: json['user'] as String,
      token: json['token'] as String,
      theme: json['theme'] as int,
      cache: json['cache'] as String,
      locale: json['locale'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'theme': instance.theme,
      'cache': instance.cache,
      'locale': instance.locale,
      'email': instance.email,
    };
