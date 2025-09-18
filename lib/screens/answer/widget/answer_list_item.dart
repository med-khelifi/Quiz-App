import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/screens/answer/widget/answer_state.dart';

class AnswerListItem extends StatelessWidget {
  const AnswerListItem({
    super.key,
    required this.isCorrect,
    required this.questionText,
    required this.correctAnswer,
    this.wrongAnswer,
    required this.index,
  });
  final bool isCorrect;
  final String questionText;
  final String correctAnswer;
  final String? wrongAnswer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
          child: Container(
            alignment: Alignment.center,
            height: 30,
            decoration: BoxDecoration(
              color: isCorrect
                  ? const Color(0xFF35AC05)
                  : ColorsManager.wongAnswerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(17.5),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              index.toString(),
              style: GoogleFonts.montserrat(
                color: ColorsManager.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 7),
        Expanded(
          flex: 100,
          child: Container(
            decoration: BoxDecoration(
              color: isCorrect
                  ? const Color(0xFF35AC05)
                  : ColorsManager.wongAnswerColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: ColorsManager.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AnswerState(isChecked: true, label: correctAnswer),
                      if (!isCorrect)
                        AnswerState(isChecked: !true, label: wrongAnswer!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
