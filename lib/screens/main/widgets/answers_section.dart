import 'package:flutter/material.dart';
import 'package:quiz/screens/main/main_screen.dart';

class AnswersSection extends StatelessWidget {
  const AnswersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomChoice(),
      separatorBuilder: (context, index)=> SizedBox(height: 10,),
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
