import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_pin_reply.g.dart';

@JsonSerializable()
class PinPinReply {
  @JsonKey(name: 'Content')
  final String? content;
  @JsonKey(name: 'Created_at')
  final String? createdAt;
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'ID')
  final int? id;
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @JsonKey(name: 'IsThumbUp')
  final bool? isThumbUp;
  @JsonKey(name: 'PinpinId')
  final int? pinpinId;
  @JsonKey(name: 'ReplyTo')
  final int? replyTo;
  @JsonKey(name: 'ThumbUpNum')
  final int? thumbUpNum;

  const PinPinReply({
    this.content,
    this.createdAt,
    this.email,
    this.id,
    this.isDeleted,
    this.isThumbUp,
    this.pinpinId,
    this.replyTo,
    this.thumbUpNum,
  });

  @override
  String toString() {
    return 'PinPinReply(content: $content, createdAt: $createdAt, email: $email, id: $id, isDeleted: $isDeleted, isThumbUp: $isThumbUp, pinpinId: $pinpinId, replyTo: $replyTo, thumbUpNum: $thumbUpNum)';
  }

  factory PinPinReply.fromJson(Map<String, dynamic> json) {
    return _$PinPinReplyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PinPinReplyToJson(this);

  PinPinReply copyWith({
    String? content,
    String? createdAt,
    String? email,
    int? id,
    bool? isDeleted,
    bool? isThumbUp,
    int? pinpinId,
    int? replyTo,
    int? thumbUpNum,
  }) {
    return PinPinReply(
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      isThumbUp: isThumbUp ?? this.isThumbUp,
      pinpinId: pinpinId ?? this.pinpinId,
      replyTo: replyTo ?? this.replyTo,
      thumbUpNum: thumbUpNum ?? this.thumbUpNum,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PinPinReply) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      content.hashCode ^
      createdAt.hashCode ^
      email.hashCode ^
      id.hashCode ^
      isDeleted.hashCode ^
      isThumbUp.hashCode ^
      pinpinId.hashCode ^
      replyTo.hashCode ^
      thumbUpNum.hashCode;
}
