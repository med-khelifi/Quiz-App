import 'package:flutter/material.dart';
import 'package:quiz/screens/main/widgets/custom_choice.dart';

class AnswersSection extends StatelessWidget {
  const AnswersSection({
    super.key,
    required this.answers,
    required this.onOptionClicked,
    required this.selectedIndexStream,
  });
  final List<String> answers;
  final void Function(int) onOptionClicked;
  final Stream<int> selectedIndexStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: selectedIndexStream,
      builder: (context, selectedIndex) {
        return ListView.separated(
          itemBuilder: (context, index) => CustomChoice(
            isSelected: selectedIndex.hasData
                ? index == selectedIndex.data
                : false,
            onOptionClicked: () => onOptionClicked(index),
            optionText: answers[index],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: answers.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
