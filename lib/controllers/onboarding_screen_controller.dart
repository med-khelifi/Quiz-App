import 'package:flutter/material.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';

class OnboardingScreenController {
  static void onMainButtonPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, RoutesNames.introScreen,(p)=> false);
  }
}
