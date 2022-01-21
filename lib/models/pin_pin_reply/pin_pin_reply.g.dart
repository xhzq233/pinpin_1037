// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_pin_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinPinReply _$PinPinReplyFromJson(Map<String, dynamic> json) => PinPinReply(
      content: json['Content'] as String?,
      createdAt: json['Created_at'] as String?,
      email: json['Email'] as String?,
      id: json['ID'] as int?,
      isDeleted: json['IsDeleted'] as bool?,
      isThumbUp: json['IsThumbUp'] as bool?,
      pinpinId: json['PinpinId'] as int?,
      replyTo: json['ReplyTo'] as int?,
      thumbUpNum: json['ThumbUpNum'] as int?,
    );

Map<String, dynamic> _$PinPinReplyToJson(PinPinReply instance) =>
    <String, dynamic>{
      'Content': instance.content,
      'Created_at': instance.createdAt,
      'Email': instance.email,
      'ID': instance.id,
      'IsDeleted': instance.isDeleted,
      'IsThumbUp': instance.isThumbUp,
      'PinpinId': instance.pinpinId,
      'ReplyTo': instance.replyTo,
      'ThumbUpNum': instance.thumbUpNum,
    };
