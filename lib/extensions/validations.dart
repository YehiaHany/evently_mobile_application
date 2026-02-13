import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

extension Validations on String {
  String? emailValidation(String? email, BuildContext context) {
    if (email == null || email.trim().isEmpty) {
      return AppLocalizations.of(context)!.email_empty;
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (!emailValid) {
      return AppLocalizations.of(context)!.email_invalid;
    }
    return null;
  }

  String? passwordValidation(
    String? password,
    BuildContext context, [
    String? confirmPassword,
  ]) {
    if (password == null || password.trim().isEmpty) {
      return AppLocalizations.of(context)!.password_empty;
    }
    if (confirmPassword != null) {
      if (password != confirmPassword) {
        return AppLocalizations.of(context)!.passwords_do_not_match;
      }
    }
    if (password.length < 6) {
      return AppLocalizations.of(context)!.password_invalid;
    }
    return null;
  }

  String? userNameValidation(String? name, BuildContext context) {
    if (name == null || name.trim().isEmpty) {
      return AppLocalizations.of(context)!.username_empty;
    }
    return null;
  }
}
