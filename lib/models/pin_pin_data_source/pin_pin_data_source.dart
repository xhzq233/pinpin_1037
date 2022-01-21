import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_pin_data_source.g.dart';

@JsonSerializable()
class PinPinDataSource {
  @JsonKey(name: 'PinpinId')
  final int? pinpinId;
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Contact_qq')
  final String? contactQq;
  @JsonKey(name: 'Contact_wechat')
  final String? contactWechat;
  @JsonKey(name: 'Contact_tel')
  final String? contactTel;
  @JsonKey(name: 'Deadline')
  final String? deadline;
  @JsonKey(name: 'Competition_introduction')
  final String? competitionIntroduction;
  @JsonKey(name: 'Demanding_num')
  final int? demandingNum;
  @JsonKey(name: 'Now_num')
  final int? nowNum;
  @JsonKey(name: 'Demanding_introduction')
  final String? demandingIntroduction;
  @JsonKey(name: 'Master_name')
  final String? masterName;
  @JsonKey(name: 'Master_sex')
  final String? masterSex;
  @JsonKey(name: 'Master_gradeandmajor')
  final String? masterGradeandmajor;
  @JsonKey(name: 'Master_introduction')
  final String? masterIntroduction;
  @JsonKey(name: 'Teammate_introduction')
  final String? teammateIntroduction;
  @JsonKey(name: 'Owner_email')
  final String? ownerEmail;
  @JsonKey(name: 'ReplyNum')
  final int? replyNum;
  @JsonKey(name: 'CreatedAt')
  final int? createdAt;
  @JsonKey(name: 'UpdatedAt')
  final int? updatedAt;

  const PinPinDataSource({
    this.pinpinId,
    this.title,
    this.contactQq,
    this.contactWechat,
    this.contactTel,
    this.deadline,
    this.competitionIntroduction,
    this.demandingNum,
    this.nowNum,
    this.demandingIntroduction,
    this.masterName,
    this.masterSex,
    this.masterGradeandmajor,
    this.masterIntroduction,
    this.teammateIntroduction,
    this.ownerEmail,
    this.replyNum,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'PinPinDataSource(pinpinId: $pinpinId, title: $title, contactQq: $contactQq, contactWechat: $contactWechat, contactTel: $contactTel, deadline: $deadline, competitionIntroduction: $competitionIntroduction, demandingNum: $demandingNum, nowNum: $nowNum, demandingIntroduction: $demandingIntroduction, masterName: $masterName, masterSex: $masterSex, masterGradeandmajor: $masterGradeandmajor, masterIntroduction: $masterIntroduction, teammateIntroduction: $teammateIntroduction, ownerEmail: $ownerEmail, replyNum: $replyNum, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory PinPinDataSource.fromJson(Map<String, dynamic> json) {
    return _$PinPinDataSourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PinPinDataSourceToJson(this);

  PinPinDataSource copyWith({
    int? pinpinId,
    String? title,
    String? contactQq,
    String? contactWechat,
    String? contactTel,
    String? deadline,
    String? competitionIntroduction,
    int? demandingNum,
    int? nowNum,
    String? demandingIntroduction,
    String? masterName,
    String? masterSex,
    String? masterGradeandmajor,
    String? masterIntroduction,
    String? teammateIntroduction,
    String? ownerEmail,
    int? replyNum,
    int? createdAt,
    int? updatedAt,
  }) {
    return PinPinDataSource(
      pinpinId: pinpinId ?? this.pinpinId,
      title: title ?? this.title,
      contactQq: contactQq ?? this.contactQq,
      contactWechat: contactWechat ?? this.contactWechat,
      contactTel: contactTel ?? this.contactTel,
      deadline: deadline ?? this.deadline,
      competitionIntroduction:
          competitionIntroduction ?? this.competitionIntroduction,
      demandingNum: demandingNum ?? this.demandingNum,
      nowNum: nowNum ?? this.nowNum,
      demandingIntroduction:
          demandingIntroduction ?? this.demandingIntroduction,
      masterName: masterName ?? this.masterName,
      masterSex: masterSex ?? this.masterSex,
      masterGradeandmajor: masterGradeandmajor ?? this.masterGradeandmajor,
      masterIntroduction: masterIntroduction ?? this.masterIntroduction,
      teammateIntroduction: teammateIntroduction ?? this.teammateIntroduction,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      replyNum: replyNum ?? this.replyNum,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PinPinDataSource) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      pinpinId.hashCode ^
      title.hashCode ^
      contactQq.hashCode ^
      contactWechat.hashCode ^
      contactTel.hashCode ^
      deadline.hashCode ^
      competitionIntroduction.hashCode ^
      demandingNum.hashCode ^
      nowNum.hashCode ^
      demandingIntroduction.hashCode ^
      masterName.hashCode ^
      masterSex.hashCode ^
      masterGradeandmajor.hashCode ^
      masterIntroduction.hashCode ^
      teammateIntroduction.hashCode ^
      ownerEmail.hashCode ^
      replyNum.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  DateTime get updateTime =>
      DateTime.fromMillisecondsSinceEpoch(updatedAt! * 1000);

  DateTime get pubTime =>
      DateTime.fromMillisecondsSinceEpoch(createdAt! * 1000);

  DateTime get expiredTime => DateTime.parse(deadline!);

  bool get haveTeamInfo => (masterIntroduction! +
          masterGradeandmajor! +
          masterSex! +
          masterName! +
          teammateIntroduction!)
      .isNotEmpty;

  String getQtyResume() => '$nowNum/$demandingNum';

  String getPublishedTimeResume() {
    final t = DateTime.now().difference(pubTime);
    if (t.inDays >= 30) {
      return '${t.inDays ~/ 30}月前';
    } else if (t.inDays >= 1) {
      return '${t.inDays}天前';
    } else if (t.inHours >= 1) {
      return '${t.inHours}小时前';
    } else if (t.inMinutes >= 1) {
      return '${t.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }

  String getContactDetailResume() {
    var res = '';
    if (contactQq != '') {
      res += "QQ: " + contactQq!;
      if (contactWechat != '' || contactTel != '') {
        res += '\n';
      }
    }
    if (contactWechat != '') {
      res += "WeChat: " + contactWechat!;
      if (contactTel != '') {
        res += '\n';
      }
    }
    if (contactTel != '') {
      res += "Tel: " + contactTel!;
    }
    return res;
  }

  String? getPersonResume() {
    var res = '';
    if (masterName!.isNotEmpty) {
      res += "姓名:" + masterName! + ' ';
    }
    if (masterSex!.isNotEmpty) {
      res += '性别:$masterSex ';
    }
    if (masterGradeandmajor!.isNotEmpty) {
      res += "年级专业:" + masterGradeandmajor! + ' ';
    }
    if (masterIntroduction!.isNotEmpty) {
      res += '\n' + masterIntroduction!;
    }
    return res.isEmpty ? null : res;
  }
}
