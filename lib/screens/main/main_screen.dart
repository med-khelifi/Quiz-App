import 'package:flutter/material.dart';
import 'package:quiz/screens/main/widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: Center(child: Text("Test"))),
    );
  }
}
