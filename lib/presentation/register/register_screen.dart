import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/register/componet/have_a_account.dart';
import 'package:tdc_coach_user/presentation/register/componet/register_button.dart';
import 'package:tdc_coach_user/presentation/register/componet/register_text.dart';
import 'package:tdc_coach_user/presentation/register/componet/register_welcome.dart';
import 'package:tdc_coach_user/presentation/register/cubit/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //text controller
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  //sign up
  void onSignUp(BuildContext context) {
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();
    final phone = phoneTextController.text.trim();
    final name = nameTextController.text.trim();
    const wallet = 0;
    final confirmPassword = confirmPasswordTextController.text.trim();

    if (name.isEmpty) {
      EasyLoading.showError('Nhập họ tên!');
      return;
    }
    if (phone.isEmpty) {
      EasyLoading.showError('Nhập số điện thoại!');
      return;
    } else if (password != confirmPassword) {
      EasyLoading.showError('Mật khẩu và xác nhận mật khẩu phải trùng nhau!');
      return;
    } else {
      RegisterController.instance.signUp(
        email: email,
        password: password,
        fullName: name,
        phone: phone,
        wallet: wallet,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RegisterWelcome(),
          Padding(
            padding: const EdgeInsets.only(top: 170),
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
                      RegisterText(
                        name: nameTextController,
                        email: emailTextController,
                        phone: phoneTextController,
                        password: passwordTextController,
                        confirmPassword: confirmPasswordTextController,
                      ),
                      RegisterButton(
                        onTap: () => onSignUp(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HaveAAccount(
                        onTap: widget.onTap,
                      )
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
