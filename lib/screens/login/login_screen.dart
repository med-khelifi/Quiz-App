import 'package:flutter/material.dart';
import 'package:quiz/controllers/login_screen_controller.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/core/resources/images/images_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = LoginScreenController();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  StringsManager.txtQ,
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 200,
                    color: ColorsManager.mainColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.txtPlayerName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.mainColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: _controller.loginFormKey,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.mainColor,
                        ),
                        validator: _controller.validateNameField,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 12,
                            color: ColorsManager.redColor,
                            fontWeight: FontWeight.w600,
                          ),
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
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.mainColor,
                          ),
                          hintText: StringsManager.txtEnterYourName,
                        ),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () => _controller.onLoginButtonPressed(context),
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
