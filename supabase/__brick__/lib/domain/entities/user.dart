part of 'entities.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
