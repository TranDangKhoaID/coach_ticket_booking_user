import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/login/component/forgot_password_button.dart';
import 'package:tdc_coach_user/presentation/login/component/login_button.dart';
import 'package:tdc_coach_user/presentation/login/component/login_text.dart';
import 'package:tdc_coach_user/presentation/login/component/login_welcome.dart';
import 'package:tdc_coach_user/presentation/login/component/not_a_remember.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  //text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginWelcome(),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginText(
                        email: emailTextController,
                        password: passwordTextController,
                      ),
                      const ForgotPasswordButton(),
                      const SizedBox(
                        height: 45,
                      ),
                      LoginButton(
                        onTap: () {
                          final email = emailTextController.text;
                          final password = passwordTextController.text;
                          LoginController.instance.login(
                            email: email,
                            password: password,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NotARemenber(
                        onTap: onTap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
