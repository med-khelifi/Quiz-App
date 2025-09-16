import 'package:flutter/material.dart';
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
      appBar: CustomAppBar(
        questionsCount: -4,
        currentQuestionIndex: -7,
        onPreviousTap: () {},
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60, right: 25, left: 25),
        child: CustomButton(onPressed: () {}, label: StringsManager.txtNext),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomQuestionSection(
                questionText: '',
                centerText: '',
                percentValue: 0.0,
              ),
              AnswersSection(
                answers: [],
                onOptionClicked: () {},
                currentSelectedIndex: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
