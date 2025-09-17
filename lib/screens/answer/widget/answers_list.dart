import 'package:flutter/material.dart';
import 'package:quiz/screens/answer/widget/answer_list_item.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => AnswerListItem(),
      separatorBuilder: (context, index) => SizedBox(height: 15,),
      itemCount: 6,
    );
  }
}
