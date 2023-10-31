import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class InForUserWidget extends StatelessWidget {
  final String fullName;
  final String email;
  final String phone;
  final void Function()? onSignOut;
  final void Function()? onUpdate;
  const InForUserWidget({
    super.key,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.onSignOut,
    required this.onUpdate,
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
            )
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
            )
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
          height: 50,
        ),
        GestureDetector(
          onTap: onUpdate,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Cập nhật thông tin',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: onSignOut,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColor.primary,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                'Đăng xuất',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
