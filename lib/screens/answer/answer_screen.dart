import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/screens/answer/widget/answers_list.dart';
import 'package:quiz/screens/answer/widget/information_label.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  late Map _answers;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _answers = ModalRoute.of(context)!.settings.arguments as Map;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10, top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InformationLabel(name: _answers["name"] ,grade: '3   /   5',),
                const SizedBox(height: 15,),
                AnswersList(answers:_answers["list"],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
 arguments: {
        "name": _playerName,
        "list": _resultAnswers,
        "grade": grade,
        "correctCount": correctCount,
        "total": questionsCount,
      },
*/