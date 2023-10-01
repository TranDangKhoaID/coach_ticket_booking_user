import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class HaveAAccount extends StatelessWidget {
  final Function()? onTap;
  const HaveAAccount({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.yourHaveAccount,
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            AppString.signIn,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
