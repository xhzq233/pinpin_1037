// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_pin_data_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinPinDataSource _$PinPinDataSourceFromJson(Map<String, dynamic> json) =>
    PinPinDataSource(
      pinpinId: json['PinpinId'] as int?,
      title: json['Title'] as String?,
      contactQq: json['Contact_qq'] as String?,
      contactWechat: json['Contact_wechat'] as String?,
      contactTel: json['Contact_tel'] as String?,
      deadline: json['Deadline'] as String?,
      competitionIntroduction: json['Competition_introduction'] as String?,
      demandingNum: json['Demanding_num'] as int?,
      nowNum: json['Now_num'] as int?,
      demandingIntroduction: json['Demanding_introduction'] as String?,
      masterName: json['Master_name'] as String?,
      masterSex: json['Master_sex'] as String?,
      masterGradeandmajor: json['Master_gradeandmajor'] as String?,
      masterIntroduction: json['Master_introduction'] as String?,
      teammateIntroduction: json['Teammate_introduction'] as String?,
      ownerEmail: json['Owner_email'] as String?,
      replyNum: json['ReplyNum'] as int?,
      createdAt: json['CreatedAt'] as int?,
      updatedAt: json['UpdatedAt'] as int?,
    );

Map<String, dynamic> _$PinPinDataSourceToJson(PinPinDataSource instance) =>
    <String, dynamic>{
      'PinpinId': instance.pinpinId,
      'Title': instance.title,
      'Contact_qq': instance.contactQq,
      'Contact_wechat': instance.contactWechat,
      'Contact_tel': instance.contactTel,
      'Deadline': instance.deadline,
      'Competition_introduction': instance.competitionIntroduction,
      'Demanding_num': instance.demandingNum,
      'Now_num': instance.nowNum,
      'Demanding_introduction': instance.demandingIntroduction,
      'Master_name': instance.masterName,
      'Master_sex': instance.masterSex,
      'Master_gradeandmajor': instance.masterGradeandmajor,
      'Master_introduction': instance.masterIntroduction,
      'Teammate_introduction': instance.teammateIntroduction,
      'Owner_email': instance.ownerEmail,
      'ReplyNum': instance.replyNum,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
    };
