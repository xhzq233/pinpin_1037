// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonContact _$PersonContactFromJson(Map<String, dynamic> json) =>
    PersonContact(
      email: json['Email'] as String?,
      contactQq: json['Contact_qq'] as String?,
      contactWechat: json['Contact_wechat'] as String?,
      contactTel: json['Contact_tel'] as String?,
    );

Map<String, dynamic> _$PersonContactToJson(PersonContact instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Contact_qq': instance.contactQq,
      'Contact_wechat': instance.contactWechat,
      'Contact_tel': instance.contactTel,
    };
