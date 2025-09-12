import 'package:flutter/material.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.dotsCount,
    required this.stream,
  });
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final int dotsCount;
  final Stream<int> stream;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36, right: 30, left: 30, top: 36),
      child: StreamBuilder<int>(
        stream: stream,
        builder: (context, asyncSnapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onSkipPressed,
                child: Text(
                  StringsManager.txtSkip,
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsManager.mainColor,
                  ),
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: asyncSnapshot.hasData ? asyncSnapshot.data! : 0 ,
                count: dotsCount,
                effect: WormEffect(
                  activeDotColor: ColorsManager.mainColor,
                  spacing: 12,
                  radius: 20,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
              TextButton(
                onPressed: onNextPressed,
                child: Text(
                  StringsManager.txtNext,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.mainColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
