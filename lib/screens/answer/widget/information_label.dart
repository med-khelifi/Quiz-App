import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class InformationLabel extends StatelessWidget {
  const InformationLabel({super.key, required this.name, required this.grade});
  final String name;
  final String grade;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name : $name",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.mainColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Grade : $grade",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.mainColor,
                  wordSpacing: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
