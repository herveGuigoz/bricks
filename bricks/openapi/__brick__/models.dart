// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'model.g.dart';

{{#ressources}}
@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}({
    {{#fields}}
    {{#readable}}{{#required}}required {{{type}}}{{/required}} {{^required}}{{{type}}}?{{/required}} {{#camelCase}}{{{name}}}{{/camelCase}},{{/readable}}
    {{/fields}}
  }) = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
}
{{/ressources}}
