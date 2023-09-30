import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class LoginText extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;

  const LoginText({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: email,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: AppColor.primary,
            ),
            label: Text(
              'Gmail',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        TextField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: AppColor.primary,
            ),
            suffixIcon: Icon(
              Icons.visibility_off,
              color: Colors.grey,
            ),
            label: Text(
              'Mật khẩu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
