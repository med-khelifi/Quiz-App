
import 'package:flutter/material.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.label});
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      height: 60,
      color: ColorsManager.mainColor,
      minWidth: double.infinity,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: ColorsManager.whiteColor,
        ),
      ),
    );
  }
}
