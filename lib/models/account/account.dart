import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String user;
  final String token;
  final int theme;
  final String cache;
  final String locale;
  final String email;

  const Account(
      {required this.user,
      required this.token,
      required this.theme,
      required this.cache,
      required this.locale,
      required this.email});

  @override
  String toString() {
    return 'Account(user: $user, token: $token, theme: $theme, cache: $cache, locale: $locale)';
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  Account copyWith({
    String? user,
    String? token,
    int? theme,
    String? cache,
    String? locale,
    String? email,
  }) {
    return Account(
      user: user ?? this.user,
      token: token ?? this.token,
      theme: theme ?? this.theme,
      cache: cache ?? this.cache,
      locale: locale ?? this.locale,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Account) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      user.hashCode ^
      token.hashCode ^
      theme.hashCode ^
      cache.hashCode ^
      locale.hashCode;
}
