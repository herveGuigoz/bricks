import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

part 'error.dart';
part 'navigation.freezed.dart';
part 'parser.dart';
part 'route.dart';
part 'router.dart';
part 'transitions.dart';

void log(String message) => developer.log(message, name: 'Navigator');
