import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class IconPositioned extends StatelessWidget {
  const IconPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 16,
      bottom: 16,
      top: 16,
      child: Center(
        child: CircleAvatar(
          radius: 32,
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          child: Icon(Icons.sync),
        ),
      ),
    );
  }
}
