part of 'http.dart';

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
