import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  const CustomCircularPercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 3000,
      radius: 43,
      lineWidth: 8,
      percent: 0.7,
      center: Text(
        "70",
        style: GoogleFonts.baloo2(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: ColorsManager.percentColor,
        ),
      ),
      progressColor: ColorsManager.mainColor,
      backgroundColor: ColorsManager.mainColorWithOpacity0_36,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
