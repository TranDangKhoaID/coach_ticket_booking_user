import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class ButtonSearchTrip extends StatelessWidget {
  final void Function()? onTap;
  final bool isDisable;
  const ButtonSearchTrip({
    super.key,
    required this.onTap,
    required this.isDisable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: isDisable ? Colors.grey : AppColor.primary,
          borderRadius: BorderRadius.circular(48),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            Text(
              "Tìm chuyến",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
