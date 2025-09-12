import 'package:flutter/material.dart';
import 'package:quiz/controllers/intro_screen_controller.dart';
import 'package:quiz/core/resources/colors/colors_manager.dart';
import 'package:quiz/screens/intro/widgets/custom_navigation_bar.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = IntroScreenController(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      bottomNavigationBar: CustomNavigationBar(
        onNextPressed: _controller.onNextPressed,
        onSkipPressed: _controller.onSkipPressed,
        dotsCount: IntroScreenController.viewPageCount(),
        stream: _controller.pageViewStream,
      ),
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: _controller.onViewPageChanged,
          itemCount: IntroScreenController.viewPageCount(),
          itemBuilder: IntroScreenController.pageViewBuilder,
          controller: _controller.pageController,
        ),
      ),
    );
  }
}
