import 'package:flutter/material.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/images/images_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesManager.loginScreenBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Q",
                  style: TextStyle(
                    fontSize: 200,
                    color: ColorsManager.mainColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Player name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.mainColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: ColorsManager.mainColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: ColorsManager.mainColor,
                            width: 2,
                          ),
                        ),
                        hintText: "Enter your name",
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  color: ColorsManager.mainColor,
                  minWidth: double.infinity,
                  child: Text(
                    StringsManager.txtStart,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
