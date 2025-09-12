import 'package:flutter/material.dart';
import 'package:quiz/core/Models/page_view.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';

class CustomViewPage extends StatelessWidget {
  const CustomViewPage({super.key, required this.model});
  final PageViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 4, child: Image(image: AssetImage(model.imagePath))),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.mainColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  model.subTitle,
                  style: TextStyle(fontSize: 20, color: ColorsManager.mainColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
