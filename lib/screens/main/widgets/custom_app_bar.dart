import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.questionsCount,
    required this.currentQuestionStream,
    required this.onPreviousTap,
  });
  final int questionsCount;
  final Stream<int> currentQuestionStream;
  final VoidCallback onPreviousTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.mainScreenBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<int>(
          stream: currentQuestionStream,
          builder: (context, asyncSnapshot) {
            return Text(
              "${asyncSnapshot.data == null ? 0 : asyncSnapshot.data!}/$questionsCount",
              style: GoogleFonts.baloo2(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blackColor,
              ),
            );
          }
        ),
      ),
      centerTitle: true,
      leadingWidth: 119,
      leading: Padding(
        padding: const EdgeInsets.only(left: 23, top: 10),
        child: InkWell(
          onTap: onPreviousTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: ColorsManager.mainColor,
                size: 24,
              ),
              Text(
                StringsManager.txtPrevious,
                style: GoogleFonts.baloo2(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
