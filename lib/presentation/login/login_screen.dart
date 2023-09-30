import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/login/component/forgot_password_button.dart';
import 'package:tdc_coach_user/presentation/login/component/login_button.dart';
import 'package:tdc_coach_user/presentation/login/component/login_text.dart';
import 'package:tdc_coach_user/presentation/login/component/login_welcome.dart';
import 'package:tdc_coach_user/presentation/login/component/not_a_remember.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_cubit.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoadingLoginState) {
              EasyLoading.show(status: 'Đang tải...');
            } else if (state is SuccessLoginState) {
              EasyLoading.dismiss();
            } else if (state is ErrorLoginState) {
              EasyLoading.dismiss();
              EasyLoading.showError(
                state.errorMessage,
                duration: const Duration(seconds: 10),
                dismissOnTap: true,
              );
            }
          },
          builder: (context, state) {
            return Stack(
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
                              BlocProvider.of<LoginCubit>(context)
                                  .signIn(email, password);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          NotARemenber(
                            onTap: widget.onTap,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
