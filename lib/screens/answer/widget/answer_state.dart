import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class AnswerState extends StatelessWidget {
  const AnswerState({super.key, required this.isChecked, required this.label});
  final bool isChecked;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            isChecked ?
            Icon(Icons.check_circle, size: 24, color: ColorsManager.mainColor) :
            CircleAvatar(
              backgroundColor: ColorsManager.mainColor,
              radius: 11,
              child: Text(
                "X",
                style: GoogleFonts.anticSlab(color: ColorsManager.whiteColor),
              ),
            ),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: ColorsManager.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
