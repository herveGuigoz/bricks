import 'package:flutter/material.dart';

class ErrorLayout extends StatelessWidget {
  const ErrorLayout({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  static const String kMessage = '''
  Veuillez nous excuser, cette page n'est actuellement pas accessible en raison de problèmes techniques.
  Nous sommes en train de résoudre le problème pour que l’accès soit rétabli le plus rapidement possible
  ''';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Text(
        message ?? kMessage,
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}
