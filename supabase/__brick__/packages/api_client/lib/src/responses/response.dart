// ignore_for_file: sort_unnamed_constructors_first

import 'dart:convert';

import 'package:api_client/src/requests/context.dart';
import 'package:http/http.dart' as http;

final class Response {
  const Response._(this.context, this.body, this.statusCode);

  factory Response(RequestContext context, http.Response response) {
    // TODO(me): Handle jsonDecode in Isolate
    final body = response.body.isEmpty ? null : jsonDecode(response.body);

    return Response._(context, body, response.statusCode);
  }

  final RequestContext context;

  final dynamic body;

  final int statusCode;

  bool get hasError {
    return !(statusCode >= 200 && statusCode < 300);
  }

  @override
  String toString() => 'Response(statusCode: $statusCode, body: $body)';
}
