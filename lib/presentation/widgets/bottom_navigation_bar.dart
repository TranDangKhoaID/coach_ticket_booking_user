import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavigationBarWidget({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20,
        ),
        child: GNav(
          padding: const EdgeInsets.all(15),
          backgroundColor: AppColor.white,
          color: Colors.black,
          activeColor: AppColor.white,
          tabBackgroundColor: AppColor.primary,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Trang chủ',
            ),
            GButton(
              icon: Icons.history,
              text: 'Lịch sử',
            ),
            GButton(
              icon: Icons.person,
              text: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }
}
