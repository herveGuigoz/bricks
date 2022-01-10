part of 'http.dart';

class ApiClient {
  ApiClient({
    Client? client,
    required this.baseURL,
  }) : _client = client ?? Client();

  /// Default http headers
  static const _headers = <Header>[AcceptJson()];

  final Client _client;
  final String baseURL;

  Uri uriFrom(String path) => Uri.https(baseURL, path);

  /// Sends an HTTP GET request for the given uri.
  Future<Response> get(
    String path, {
    List<Header> headers = _headers,
  }) async {
    final response = await _client.get(
      uriFrom(path),
      headers: Header.merge(headers),
    );

    if (response.statusCode != 200) throw ApiException(response.statusCode);

    return response;
  }

  /// Sends an HTTP POST request for the given uri.
  Future<Response> post(
    String path, {
    List<Header> headers = const [JsonContentType(), ..._headers],
    required Map<String, Object> body,
  }) async {
    final response = await _client.post(
      uriFrom(path),
      headers: Header.merge(headers),
      body: jsonEncode(body),
    );

    if (response.statusCode > 204) throw ApiException(response.statusCode);

    return response;
  }

  /// Sends an HTTP PUT request for the given uri.
  Future<Response> put(
    String path, {
    List<Header> headers = const [JsonContentType(), ..._headers],
    required Map<String, Object> body,
  }) async {
    final response = await _client.put(
      uriFrom(path),
      headers: Header.merge(headers),
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) throw ApiException(response.statusCode);

    return response;
  }

  /// Sends an HTTP DELETE request for the given uri.
  Future<Response> delete(
    String path, {
    List<Header> headers = _headers,
  }) async {
    final response = await _client.delete(
      uriFrom(path),
      headers: Header.merge(headers),
    );

    if (response.statusCode != 204) throw ApiException(response.statusCode);

    return response;
  }
}

class ApiException implements Exception {
  ApiException(int statusCode) : statusCode = StatusCode(statusCode);

  final StatusCode statusCode;

  String get reason => statusCode.reason;

  @override
  String toString() => '${statusCode.code}: ${statusCode.reason}';
}
