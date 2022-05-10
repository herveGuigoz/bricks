// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Unauthenticated _$$UnauthenticatedFromJson(Map<String, dynamic> json) =>
    _$Unauthenticated(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnauthenticatedToJson(_$Unauthenticated instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Authenticated _$$AuthenticatedFromJson(Map<String, dynamic> json) =>
    _$Authenticated(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthenticatedToJson(_$Authenticated instance) =>
    <String, dynamic>{
      'user': instance.user,
      'runtimeType': instance.$type,
    };
