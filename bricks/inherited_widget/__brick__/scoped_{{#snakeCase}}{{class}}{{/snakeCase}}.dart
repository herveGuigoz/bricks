import 'package:flutter/widgets.dart';

/// Provide [{{#pascalCase}}{{class}}{{/pascalCase}}] to the subtree.
class Scoped{{#pascalCase}}{{class}}{{/pascalCase}} extends InheritedWidget {
  const Scoped{{#pascalCase}}{{class}}{{/pascalCase}}({
    Key? key,
    required this.{{#camelCase}}{{class}}{{/camelCase}},
    required Widget child,
  }) : super(key: key, child: child);

  final {{#pascalCase}}{{class}}{{/pascalCase}} {{#camelCase}}{{class}}{{/camelCase}};

  /// Obtains the nearest element of type {{#pascalCase}}{{class}}{{/pascalCase}}
  /// 
  /// This method does not establish a relationship with the target in the way 
  /// that [of] does.
  static {{#pascalCase}}{{class}}{{/pascalCase}} read(BuildContext context) {
    final res = context.getElementForInheritedWidgetOfExactType<Scoped{{#pascalCase}}{{class}}{{/pascalCase}}>();
    assert(res != null, 'No Scoped{{#pascalCase}}{{class}}{{/pascalCase}} found in context');
    return (res!.widget as Scoped{{#pascalCase}}{{class}}{{/pascalCase}}).{{#camelCase}}{{class}}{{/camelCase}};
  }

  /// Obtains and listen to the nearest element of type {{#pascalCase}}{{class}}{{/pascalCase}}
  static {{#pascalCase}}{{class}}{{/pascalCase}} of(BuildContext context) {
    final res = context.dependOnInheritedWidgetOfExactType<Scoped{{#pascalCase}}{{class}}{{/pascalCase}}>();
    assert(res != null, 'No Scoped{{#pascalCase}}{{class}}{{/pascalCase}} found in context');
    return res!.{{#camelCase}}{{class}}{{/camelCase}};
  }

  @override
  bool updateShouldNotify(Scoped{{#pascalCase}}{{class}}{{/pascalCase}} oldWidget) {
    return {{#camelCase}}{{class}}{{/camelCase}} != oldWidget.{{#camelCase}}{{class}}{{/camelCase}};
  }
}