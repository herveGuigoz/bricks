import 'package:meta/meta.dart';

@immutable
class RequestContext {
  const RequestContext({
    required this.method,
    required this.path,
    required this.authorizationRequired,
    this.headers,
    this.queryParameters,
    this.body,
  });

  final bool authorizationRequired;

  final Map<String, Object?>? body;

  final Map<String, String>? headers;

  final String method;

  final String path;

  final Map<String, Object>? queryParameters;

  /// Returns the full URL of the request.
  Uri get url {
    final params = queryParameters?.encoded;
    final uri = Uri.parse(path).replace(queryParameters: params);
    assert(uri.hasScheme, 'The path must contain a scheme ($path)');

    return uri;
  }

  /// Adds a header with [name] and [value] to [headers].
  RequestContext addHeader(String name, String value) {
    final headers = Map<String, String>.from(this.headers ?? {});
    headers[name] = value;

    return copyWith(headers: headers);
  }

  /// Removed the header with name [name].
  RequestContext removeHeader(String name) {
    final headers = Map<String, String>.from(this.headers ?? {})..removeWhere((header, value) => header == name);

    return copyWith(headers: headers);
  }

  RequestContext copyWith({
    String? method,
    String? path,
    bool? authorizationRequired,
    Map<String, String>? headers,
    Map<String, Object>? queryParameters,
    Map<String, Object?>? body,
  }) {
    return RequestContext(
      method: method ?? this.method,
      path: path ?? this.path,
      authorizationRequired: authorizationRequired ?? this.authorizationRequired,
      headers: headers ?? this.headers,
      queryParameters: queryParameters ?? this.queryParameters,
      body: body ?? this.body,
    );
  }

  @override
  bool operator ==(covariant RequestContext other) {
    if (identical(this, other)) return true;

    return other.method == method &&
        other.path == path &&
        other.authorizationRequired == authorizationRequired &&
        _mapEquals(other.headers, headers) &&
        _mapEquals(other.queryParameters, queryParameters) &&
        _mapEquals(other.body, body);
  }

  @override
  int get hashCode {
    return method.hashCode ^
        path.hashCode ^
        authorizationRequired.hashCode ^
        headers.hashCode ^
        queryParameters.hashCode ^
        body.hashCode;
  }

  @override
  String toString() {
    return 'RequestContext(method: $method, path: $path, headers: $headers, queryParameters: $queryParameters, body: $body)';
  }
}

bool _mapEquals<T, U>(Map<T, U>? a, Map<T, U>? b) {
  if (a == null) {
    return b == null;
  }
  if (b == null || a.length != b.length) {
    return false;
  }
  if (identical(a, b)) {
    return true;
  }
  for (final key in a.keys) {
    if (!b.containsKey(key) || b[key] != a[key]) {
      return false;
    }
  }
  return true;
}

extension on Map<String, Object> {
  /// Returns the encoded query parameters.
  Map<String, String> get encoded {
    return {
      for (final entry in entries) entry.key: entry.value.encoded(),
    };
  }
}

extension on Object {
  String encoded() {
    if (this is bool) {
      return Uri.encodeQueryComponent((this as bool) ? '1' : '0');
    }
    return Uri.encodeQueryComponent(toString());
  }
}
