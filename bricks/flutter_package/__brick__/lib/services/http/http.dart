import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/app/configuration.dart';

part 'handshake_override.dart';
part 'http_client.dart';
part 'http_enum.dart';
part 'http_headers.dart';
