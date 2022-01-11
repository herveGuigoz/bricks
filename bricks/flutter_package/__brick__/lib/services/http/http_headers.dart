part of 'http.dart';

abstract class Header {
  const Header(this.key, this.value);

  static Map<String, String> merge(List<Header> values) {
    return {for (var v in values) v.key: v.value};
  }

  final String key;
  final String value;

  Map<String, String> toMap() => {key: value};
}

class JsonContentType extends Header {
  const JsonContentType() : super('Content-Type', 'application/json');
}

class AcceptJson extends Header {
  const AcceptJson() : super('Accept', 'application/json');
}

class Bearer extends Header {
  const Bearer(String value) : super('Authorization', 'Bearer $value');
}
