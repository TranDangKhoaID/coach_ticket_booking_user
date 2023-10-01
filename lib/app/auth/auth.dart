import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/auth/login_or_register.dart';
import 'package:tdc_coach_user/presentation/home_page/home_page_screen.dart';
import 'package:tdc_coach_user/presentation/widgets/body_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged
          if (snapshot.hasData) {
            return const BodyPage();
          }
          //user is not logged
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
