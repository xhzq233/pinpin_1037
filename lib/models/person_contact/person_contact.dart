import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_contact.g.dart';

@JsonSerializable()
class PersonContact {
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'Contact_qq')
  final String? contactQq;
  @JsonKey(name: 'Contact_wechat')
  final String? contactWechat;
  @JsonKey(name: 'Contact_tel')
  final String? contactTel;

  const PersonContact({
    this.email,
    this.contactQq,
    this.contactWechat,
    this.contactTel,
  });

  @override
  String toString() {
    return 'PersonContact(email: $email, contactQq: $contactQq, contactWechat: $contactWechat, contactTel: $contactTel)';
  }

  factory PersonContact.fromJson(Map<String, dynamic> json) {
    return _$PersonContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonContactToJson(this);

  PersonContact copyWith({
    String? email,
    String? contactQq,
    String? contactWechat,
    String? contactTel,
  }) {
    return PersonContact(
      email: email ?? this.email,
      contactQq: contactQq ?? this.contactQq,
      contactWechat: contactWechat ?? this.contactWechat,
      contactTel: contactTel ?? this.contactTel,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PersonContact) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      email.hashCode ^
      contactQq.hashCode ^
      contactWechat.hashCode ^
      contactTel.hashCode;
}
