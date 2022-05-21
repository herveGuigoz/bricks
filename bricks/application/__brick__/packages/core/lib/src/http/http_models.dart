// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_models.freezed.dart';
part 'http_models.g.dart';

@freezed
class Credentials with _$Credentials {
  const factory Credentials({
    required String token,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}

abstract class Header {
  factory Header.acceptJson() = AcceptJson;
  factory Header.jsonContentType() = JsonContentType;
  factory Header.bearer(String jwt) = Bearer;

  static Map<String, String> merge(List<Header> values) {
    return values.fold({}, (map, header) => map..addAll(header.toMap()));
  }

  Map<String, String> toMap();
}

class JsonContentType implements Header {
  const JsonContentType();

  @override
  Map<String, String> toMap() => {'Content-Type': 'application/json'};
}

class AcceptJson implements Header {
  const AcceptJson();

  @override
  Map<String, String> toMap() => {'Accept': 'application/json'};
}

class Bearer implements Header {
  const Bearer(this.jwt);

  final String jwt;

  @override
  Map<String, String> toMap() => {'Authorization': 'Bearer $jwt'};
}
