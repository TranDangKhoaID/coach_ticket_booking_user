import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class BTNPayAccount extends StatelessWidget {
  final bool isConfrimPay;
  final void Function()? onTap;
  const BTNPayAccount({
    super.key,
    required this.isConfrimPay,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomAppBar(
        elevation: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: isConfrimPay ? onTap : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isConfrimPay ? AppColor.primary : Colors.grey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text(
                        "Nạp",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
