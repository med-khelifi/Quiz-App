import 'package:flutter/material.dart';
import 'package:quiz/screens/main/widgets/custom_choice.dart';

class AnswersSection extends StatelessWidget {
  const AnswersSection({super.key, required this.answers, required this.onOptionClicked, required this.currentSelectedIndex});
  final List<String> answers;
  final VoidCallback onOptionClicked;
  final int currentSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomChoice(
        isSelected: index == currentSelectedIndex,
        onOptionClicked: onOptionClicked,
        optionText: answers[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
