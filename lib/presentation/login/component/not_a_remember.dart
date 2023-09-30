import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class NotARemenber extends StatelessWidget {
  final Function()? onTap;
  const NotARemenber({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.notARemenber,
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
            AppString.signUp,
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
