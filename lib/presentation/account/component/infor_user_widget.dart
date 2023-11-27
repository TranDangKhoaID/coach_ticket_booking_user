import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class InForUserWidget extends StatelessWidget {
  final String fullName;
  final String email;
  final String phone;
  final void Function()? onTapUpdateFullName;
  final void Function()? onTapUpdatePhone;

  const InForUserWidget({
    super.key,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.onTapUpdateFullName,
    required this.onTapUpdatePhone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Họ & Tên',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              fullName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: onTapUpdateFullName,
              icon: Icon(
                Icons.settings,
                color: AppColor.primary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Số điện thoại',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              phone,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: onTapUpdatePhone,
              icon: Icon(
                Icons.settings,
                color: AppColor.primary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Email',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
