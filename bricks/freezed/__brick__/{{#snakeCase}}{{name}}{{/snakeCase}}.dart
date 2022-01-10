import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}() = _{{#pascalCase}}{{name}}{{/pascalCase}};
}
