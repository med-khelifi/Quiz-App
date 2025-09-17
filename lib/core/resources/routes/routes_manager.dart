import 'package:flutter/material.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';
import 'package:quiz/screens/answer/answer_screen.dart';
import 'package:quiz/screens/intro/intro_screen.dart';
import 'package:quiz/screens/login/login_screen.dart';
import 'package:quiz/screens/main/main_screen.dart';
import 'package:quiz/screens/onboarding/onboarding_screen.dart';

class RoutesManager {
  static Map<String, WidgetBuilder> routes = {
    RoutesNames.mainScreen : (context) => MainScreen(),
    RoutesNames.onboardingScreen : (context) => OnboardingScreen(),
    RoutesNames.introScreen : (context) => IntroScreen(),
    RoutesNames.loginScreen : (context) => LoginScreen(),
    RoutesNames.answerScreen : (context) => AnswerScreen(),
  };
}