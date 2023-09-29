import 'package:flutter/material.dart';
import 'package:tdc_coach_user/presentation/login/login_screen.dart';
import 'package:tdc_coach_user/presentation/register/register_screen.dart';

class RouteName {
  RouteName._();
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
}

class RouteGenerator {
  static final routes = <String, WidgetBuilder>{
    RouteName.signIn: (BuildContext context) => const LoginScreen(),
    RouteName.signUp: (BuildContext context) => const RegisterScreen(),
  };
}
