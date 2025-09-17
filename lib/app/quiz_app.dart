import 'package:flutter/material.dart';
import 'package:quiz/core/resources/routes/routes_manager.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';
import 'package:quiz/screens/onboarding/onboarding_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Montserrat"),
      home: OnboardingScreen(),
      routes: RoutesManager.routes,
      initialRoute: RoutesNames.answerScreen,
    );
  }
}
