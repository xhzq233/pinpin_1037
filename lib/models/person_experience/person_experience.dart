import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_experience.g.dart';

@JsonSerializable()
class PersonExperience {
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'Master_name')
  final String? masterName;
  @JsonKey(name: 'Master_sex')
  final String? masterSex;
  @JsonKey(name: 'Master_gradeandmajor')
  final String? masterGradeandmajor;
  @JsonKey(name: 'Master_introduction')
  final String? masterIntroduction;

  const PersonExperience({
    this.email,
    this.masterName,
    this.masterSex,
    this.masterGradeandmajor,
    this.masterIntroduction,
  });

  @override
  String toString() {
    return 'PersonExperience(email: $email, masterName: $masterName, masterSex: $masterSex, masterGradeandmajor: $masterGradeandmajor, masterIntroduction: $masterIntroduction)';
  }

  factory PersonExperience.fromJson(Map<String, dynamic> json) {
    return _$PersonExperienceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonExperienceToJson(this);

  PersonExperience copyWith({
    String? email,
    String? masterName,
    String? masterSex,
    String? masterGradeandmajor,
    String? masterIntroduction,
  }) {
    return PersonExperience(
      email: email ?? this.email,
      masterName: masterName ?? this.masterName,
      masterSex: masterSex ?? this.masterSex,
      masterGradeandmajor: masterGradeandmajor ?? this.masterGradeandmajor,
      masterIntroduction: masterIntroduction ?? this.masterIntroduction,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PersonExperience) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      email.hashCode ^
      masterName.hashCode ^
      masterSex.hashCode ^
      masterGradeandmajor.hashCode ^
      masterIntroduction.hashCode;
}
