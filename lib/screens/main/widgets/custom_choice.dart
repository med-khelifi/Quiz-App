import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class CustomChoice extends StatelessWidget {
  const CustomChoice({
    super.key,
    required this.isSelected,
    required this.onOptionClicked,
    required this.optionText,
  });
  final bool isSelected;
  final void Function() onOptionClicked;
  final String optionText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOptionClicked,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorsManager.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionText,
              style: GoogleFonts.baloo2(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainColor,
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle_sharp : Icons.circle_outlined,
              color: ColorsManager.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
