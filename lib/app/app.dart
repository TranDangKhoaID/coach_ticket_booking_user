import 'package:flutter/material.dart';
import 'package:tdc_coach_user/presentation/login/login_screen.dart';
import 'package:tdc_coach_user/presentation/register/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
