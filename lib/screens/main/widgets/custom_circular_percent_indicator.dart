import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  const CustomCircularPercentIndicator({
    super.key,
    required this.durationStream,
    required this.percentValueStream,
  });
  final Stream<int> durationStream;
  final Stream<double> percentValueStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: percentValueStream,
      builder: (context, asyncSnapshot) {
        return CircularPercentIndicator(
          radius: 43,
          lineWidth: 8,
          percent: asyncSnapshot.data == null ? 0 : asyncSnapshot.data!,
          center: StreamBuilder<int>(
            stream: durationStream,
            builder: (context, asyncSnapshot) {
              return Text(
                asyncSnapshot.hasData ? asyncSnapshot.data!.toString() : "d0",
                style: GoogleFonts.baloo2(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.percentColor,
                ),
              );
            },
          ),
          progressColor: ColorsManager.mainColor,
          backgroundColor: ColorsManager.mainColorWithOpacity0_36,
          circularStrokeCap: CircularStrokeCap.round,
        );
      },
    );
  }
}
