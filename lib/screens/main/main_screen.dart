import 'package:flutter/material.dart';
import 'package:quiz/controllers/main_screen_controller.dart';
import 'package:quiz/core/Models/question.dart';
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
  late MainScreenController _controller;
  late Question question;
  @override
  void initState() {
    super.initState();
    _controller = MainScreenController(questionsCount: 4, context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String name = ModalRoute.of(context)!.settings.arguments as String;
    _controller.startQuiz(playerName: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainScreenBackgroundColor,
      appBar: CustomAppBar(
        questionsCount: _controller.questionsCount,
        onPreviousTap: _controller.onPreviousButtonTapped,
        currentQuestionStream: _controller.currentQuestionIndexStream,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60, right: 25, left: 25),
        child: CustomButton(
          onPressed: _controller.onNextButtonPressed,
          label: StringsManager.txtNext,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: StreamBuilder<Question>(
              stream: _controller.questionStream,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.data == null) {
                  question = Question(
                    question: '',
                    answers: [],
                    correctAnswerIndex: 0,
                  );
                } else {
                  question = asyncSnapshot.data!;
                }
                return Column(
                  children: [
                    CustomQuestionSection(
                      questionText: question.question,
                      durationStream: _controller.counterStream,
                      percentValueStream: _controller.percentStream,
                    ),
                    SizedBox(height: 30),
                    AnswersSection(
                      answers: question.answers,
                      onOptionClicked: _controller.onOptionSelected,
                      selectedIndexStream: _controller.selectedIndexStream,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
