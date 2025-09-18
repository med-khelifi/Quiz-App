import 'package:flutter/material.dart';
import 'package:quiz/core/Models/question_answer_result.dart';
import 'package:quiz/screens/answer/widget/answer_list_item.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({super.key, required this.answers});
  final List<QuestionAnswerResult> answers;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => AnswerListItem(
        isCorrect: answers[index].isCorrect,
        questionText: answers[index].question,
        correctAnswer: answers[index].correctAnswer,
        wrongAnswer: answers[index].wrongAnswer,
        index: answers[index].questionNumber,
      ),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: answers.length,
    );
  }
}
