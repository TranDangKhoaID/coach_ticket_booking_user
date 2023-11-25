import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class AccountSignoutWidget extends StatelessWidget {
  const AccountSignoutWidget({
    super.key,
    required this.onSignOut,
  });

  final void Function()? onSignOut;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
