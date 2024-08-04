import 'localization.dart';

enum AppLocalizationKeys {
  welcome,
}

extension AppLocalizationKeysExt on AppLocalizationKeys {
  String? localized(AppLocalizations localization,
      [Map<String, String>? params]) {
    switch (this) {
      case AppLocalizationKeys.welcome:
        return localization.welcome;
    }
  }


}