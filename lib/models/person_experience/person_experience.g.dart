// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonExperience _$PersonExperienceFromJson(Map<String, dynamic> json) =>
    PersonExperience(
      email: json['Email'] as String?,
      masterName: json['Master_name'] as String?,
      masterSex: json['Master_sex'] as String?,
      masterGradeandmajor: json['Master_gradeandmajor'] as String?,
      masterIntroduction: json['Master_introduction'] as String?,
    );

Map<String, dynamic> _$PersonExperienceToJson(PersonExperience instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Master_name': instance.masterName,
      'Master_sex': instance.masterSex,
      'Master_gradeandmajor': instance.masterGradeandmajor,
      'Master_introduction': instance.masterIntroduction,
    };
