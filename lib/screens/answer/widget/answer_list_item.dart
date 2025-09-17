import 'package:flutter/material.dart';

class AnswerListItem extends StatelessWidget {
  const AnswerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF35AC05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(17.5),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 100,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF35AC05),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
