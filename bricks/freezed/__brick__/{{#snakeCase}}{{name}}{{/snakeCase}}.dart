import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#lowerCase}}{{name}}{{/lowerCase}}.freezed.dart';
part '{{#lowerCase}}{{name}}{{/lowerCase}}.g.dart';

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}() = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
}
