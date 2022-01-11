part of 'http.dart';

class Method {
  const Method._(this.name);
  final String name;

  static const get = Method._('GET');
  static const head = Method._('HEAD');
  static const post = Method._('POST');
  static const put = Method._('PUT');
  static const delete = Method._('DELETE');
  static const connect = Method._('CONNECT');
  static const options = Method._('OPTIONS');
  static const trace = Method._('TRACE');
  static const patch = Method._('PATCH');

  @override
  String toString() => name;
}

class StatusCode {
  factory StatusCode(int code) {
    return _allStatuses.firstWhere((element) => element.code == code);
  }

  // Informational 1xx
  const StatusCode._http_100()
      : code = 100,
        reason = 'Continue';
  const StatusCode._http_101()
      : code = 101,
        reason = 'Switching Protocols';
  const StatusCode._http_102()
      : code = 102,
        reason = 'Processing';
  const StatusCode._http_103()
      : code = 103,
        reason = 'Early Hints';

  // Successful 2xx
  const StatusCode._http_200()
      : code = 200,
        reason = 'OK';
  const StatusCode._http_201()
      : code = 201,
        reason = 'Created';
  const StatusCode._http_202()
      : code = 202,
        reason = 'Accepted';
  const StatusCode._http_203()
      : code = 203,
        reason = 'Non-Authoritative Information';
  const StatusCode._http_204()
      : code = 204,
        reason = 'No Content';
  const StatusCode._http_205()
      : code = 205,
        reason = 'Reset Content';
  // The status codes 209-225 are unassigned.
  const StatusCode._http_226()
      : code = 226,
        reason = 'IM Used';

  // The status codes 227-299 are unassigned.

  // Redirection 3xx
  const StatusCode._http_300()
      : code = 300,
        reason = 'Multiple Choices';
  const StatusCode._http_301()
      : code = 301,
        reason = 'Moved Permanently';
  const StatusCode._http_302()
      : code = 302,
        reason = 'Found';
  const StatusCode._http_303()
      : code = 303,
        reason = 'See Other';
  const StatusCode._http_304()
      : code = 304,
        reason = 'Not Modified';
  const StatusCode._http_305()
      : code = 305,
        reason = 'Use Proxy';
  const StatusCode._http_307()
      : code = 307,
        reason = 'Temporary Redirect';
  const StatusCode._http_308()
      : code = 308,
        reason = 'Permanent Redirect';
  // The status codes 309-399 are unassigned.

  // Client Error 4xx
  const StatusCode._http_400()
      : code = 400,
        reason = 'Bad Request';
  const StatusCode._http_401()
      : code = 401,
        reason = 'Unauthorized';
  const StatusCode._http_402()
      : code = 402,
        reason = 'Payment Required';
  const StatusCode._http_403()
      : code = 403,
        reason = 'Forbidden';
  const StatusCode._http_404()
      : code = 404,
        reason = 'Not Found';
  const StatusCode._http_405()
      : code = 405,
        reason = 'Method Not Allowed';
  const StatusCode._http_406()
      : code = 406,
        reason = 'Not Acceptable';
  const StatusCode._http_407()
      : code = 407,
        reason = 'Proxy Authentication Required';
  const StatusCode._http_408()
      : code = 408,
        reason = 'Request Timeout';
  const StatusCode._http_409()
      : code = 409,
        reason = 'Conflict';
  const StatusCode._http_410()
      : code = 410,
        reason = 'Gone';
  const StatusCode._http_411()
      : code = 411,
        reason = 'Length Required';
  const StatusCode._http_412()
      : code = 412,
        reason = 'Precondition Failed';
  const StatusCode._http_413()
      : code = 413,
        reason = 'Payload Too Large';
  const StatusCode._http_414()
      : code = 414,
        reason = 'URI Too Long';
  const StatusCode._http_415()
      : code = 415,
        reason = 'Unsupported Media Type';
  const StatusCode._http_416()
      : code = 416,
        reason = 'Range Not Satisfiable';
  const StatusCode._http_417()
      : code = 417,
        reason = 'Expectation Failed';
  // The status codes 418-420 are unassigned.
  const StatusCode._http_421()
      : code = 421,
        reason = 'Misdirected Request';
  const StatusCode._http_422()
      : code = 422,
        reason = 'Unprocessable Entity';
  const StatusCode._http_423()
      : code = 423,
        reason = 'Locked';
  const StatusCode._http_424()
      : code = 424,
        reason = 'Failed Dependency';
  const StatusCode._http_425()
      : code = 425,
        reason = 'Too Early';
  const StatusCode._http_426()
      : code = 426,
        reason = 'Upgrade Required';
  // The status code 427 is unassigned.
  const StatusCode._http_428()
      : code = 428,
        reason = 'Precondition Required';
  const StatusCode._http_429()
      : code = 429,
        reason = 'Too Many Requests';
  // The status code 430 is unassigned.
  const StatusCode._http_431()
      : code = 431,
        reason = 'Request Header Fields Too Large';
  // The status codes 432-450 are unassigned.
  const StatusCode._http_451()
      : code = 451,
        reason = 'Unavailable For Legal Reasons';
  // The status codes 452-499 are unassigned.

  // Server Error 5xx
  const StatusCode._http_500()
      : code = 500,
        reason = 'Internal Server Error';
  const StatusCode._http_501()
      : code = 501,
        reason = 'Not Implemented';
  const StatusCode._http_502()
      : code = 502,
        reason = 'Bad Gateway';
  const StatusCode._http_503()
      : code = 503,
        reason = 'Service Unavailable';
  const StatusCode._http_504()
      : code = 504,
        reason = 'Gateway Timeout';
  const StatusCode._http_505()
      : code = 505,
        reason = 'HTTP Version Not Supported';
  const StatusCode._http_506()
      : code = 506,
        reason = 'Variant Also Negotiates';
  const StatusCode._http_507()
      : code = 507,
        reason = 'Insufficient Storage';
  const StatusCode._http_508()
      : code = 508,
        reason = 'Loop Detected';
  // The status code 509 is unassigned.
  const StatusCode._http_510()
      : code = 510,
        reason = 'Not Extended';
  const StatusCode._http_511()
      : code = 511,
        reason = 'Network Authentication Required';
  // The status codes 512-599 are unassigned.

  static String reasonPhrase(int code) {
    final theOne = _allStatuses.firstWhere(
      (status) => status.code == code,
      orElse: () => throw Exception('Invalid status code $code'),
    );
    return theOne.reason;
  }

  final int code;
  final String reason;
}

const _allStatuses = <StatusCode>[
  StatusCode._http_100(),
  StatusCode._http_101(),
  StatusCode._http_102(),
  StatusCode._http_103(),
  StatusCode._http_200(),
  StatusCode._http_201(),
  StatusCode._http_202(),
  StatusCode._http_203(),
  StatusCode._http_204(),
  StatusCode._http_205(),
  StatusCode._http_226(),
  StatusCode._http_300(),
  StatusCode._http_301(),
  StatusCode._http_302(),
  StatusCode._http_303(),
  StatusCode._http_304(),
  StatusCode._http_305(),
  StatusCode._http_307(),
  StatusCode._http_308(),
  StatusCode._http_400(),
  StatusCode._http_401(),
  StatusCode._http_402(),
  StatusCode._http_403(),
  StatusCode._http_404(),
  StatusCode._http_405(),
  StatusCode._http_406(),
  StatusCode._http_407(),
  StatusCode._http_408(),
  StatusCode._http_409(),
  StatusCode._http_410(),
  StatusCode._http_411(),
  StatusCode._http_412(),
  StatusCode._http_413(),
  StatusCode._http_414(),
  StatusCode._http_415(),
  StatusCode._http_416(),
  StatusCode._http_417(),
  StatusCode._http_421(),
  StatusCode._http_422(),
  StatusCode._http_423(),
  StatusCode._http_424(),
  StatusCode._http_425(),
  StatusCode._http_426(),
  StatusCode._http_428(),
  StatusCode._http_429(),
  StatusCode._http_431(),
  StatusCode._http_451(),
  StatusCode._http_500(),
  StatusCode._http_501(),
  StatusCode._http_502(),
  StatusCode._http_503(),
  StatusCode._http_504(),
  StatusCode._http_505(),
  StatusCode._http_506(),
  StatusCode._http_507(),
  StatusCode._http_508(),
  StatusCode._http_510(),
  StatusCode._http_511(),
];
