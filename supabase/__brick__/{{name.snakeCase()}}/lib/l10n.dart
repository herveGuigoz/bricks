import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/{{name.snakeCase()}}_localizations.dart';

export 'package:flutter_gen/gen_l10n/{{name.snakeCase()}}_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
