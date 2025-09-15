import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';
import 'package:quiz/screens/login/widgets/custom_button.dart';
import 'package:quiz/screens/main/widgets/answers_section.dart';
import 'package:quiz/screens/main/widgets/custom_app_bar.dart';
import 'package:quiz/screens/main/widgets/custom_question__section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainScreenBackgroundColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomQuestionSection(),
              AnswersSection(),
              CustomButton(onPressed: () {}, label: StringsManager.txtNext),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomChoice extends StatelessWidget {
  const CustomChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "2026",
            style: GoogleFonts.baloo2(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainColor,
            ),
          ),
          Icon(Icons.check_circle_sharp, color: ColorsManager.mainColor),
          Icon(Icons.circle_outlined, color: ColorsManager.mainColor),
        ],
      ),
    );
  }
}
