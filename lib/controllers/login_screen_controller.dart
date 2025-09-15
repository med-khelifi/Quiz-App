import 'package:flutter/material.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';

class LoginScreenController {
  late final GlobalKey<FormState> _loginFormKey;
  late final TextEditingController _inputFormController;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;
  TextEditingController get inputFormController => _inputFormController;

  LoginScreenController() {
    _inputFormController = TextEditingController();
    _loginFormKey = GlobalKey<FormState>();
  }
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
      Navigator.pushNamed(
        context,
        arguments: _inputFormController.text,
        RoutesNames.mainScreen,
      );
    }
  }
}
