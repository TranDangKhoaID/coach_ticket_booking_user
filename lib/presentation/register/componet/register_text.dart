import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class RegisterText extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const RegisterText({
    super.key,
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: name,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: AppColor.primary,
            ),
            label: Text(
              'Họ tên',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: AppColor.primary,
            ),
            suffixIcon: Icon(
              Icons.check,
              color: Colors.grey,
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
          controller: phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: AppColor.primary,
            ),
            label: Text(
              'Số điện thoại',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        TextField(
          obscureText: true,
          controller: password,
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
        TextField(
          obscureText: true,
          controller: confirmPassword,
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
              'Xác nhận mật khẩu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }
}
