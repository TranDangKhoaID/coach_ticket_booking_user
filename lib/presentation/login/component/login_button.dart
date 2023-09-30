import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  const LoginButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              AppColor.primary,
              AppColor.secondary,
            ],
          ),
        ),
        child: const Center(
          child: Text(
            AppString.signIn,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
