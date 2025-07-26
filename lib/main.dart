import 'package:flutter/material.dart';
import 'package:food_market/controller/user_state.dart';
import 'package:food_market/view/pages/onboarding_page.dart';

void main() async {
  await States.storeUserState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: OnBoarding());
  }
}
