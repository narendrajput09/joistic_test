import 'package:flutter/widgets.dart';
import 'localization.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}

extension Validator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    if (isEmpty) return false;
    if (length < 6) return false;
    return true;
  }

  bool isValidValue() {
    if (isEmpty) return false;
    return true;
  }






}



