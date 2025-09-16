import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/screens/main/widgets/custom_circular_percent_indicator.dart';

class CustomQuestionSection extends StatelessWidget {
  const CustomQuestionSection({
    super.key,
    required this.questionText,
    required this.durationStream,
    required this.percentDuration,
    required this.onAnimationEnd,
    required this.percentValueStream,
  });
  final String questionText;
  final Stream<int> durationStream;
  final Stream<double> percentValueStream;
  final int percentDuration;
  final VoidCallback onAnimationEnd;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // vertical: 70,
              horizontal: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 230,
              child: Center(
                child: Text(
                  questionText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.mainColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: -42,
          child: CustomCircularPercentIndicator(
            percent: percentDuration,
            durationStream: durationStream,
            percentValueStream: percentValueStream,
          ),
        ),
      ],
    );
  }
}
