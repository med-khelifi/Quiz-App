import 'package:flutter/material.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';

class LoginScreenController {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  String? validateNameField(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can't be empty";
    } else if (value.length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  void onLoginButtonPressed(BuildContext context) {
    if (_loginFormKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, RoutesNames.mainScreen);
    }
  }
}
