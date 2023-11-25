import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class AccountTopUpWidget extends StatelessWidget {
  final void Function()? onTap;
  const AccountTopUpWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Icon(
              Icons.attach_money,
              color: AppColor.primary,
            ),
            Text(
              'Lịch sử nạp tiền',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: Colors.grey.shade200,
            )
          ],
        ),
      ),
    );
  }
}
