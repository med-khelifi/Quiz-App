import 'package:flutter/material.dart';
import 'package:quiz/controllers/onboarding_screen_controller.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                StringsManager.txtQ,
                style: TextStyle(
                  fontSize: 400,
                  fontWeight: FontWeight.w300,
                  color: ColorsManager.whiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: MaterialButton(
                  onPressed: () =>
                      OnboardingScreenController.onMainButtonPressed(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 70,
                  color: ColorsManager.whiteColor,
                  minWidth: double.infinity,
                  child: Text(
                    StringsManager.txtGetStarted,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: ColorsManager.mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
