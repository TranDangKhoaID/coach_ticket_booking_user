import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';

class GeneralSeatComponet extends StatefulWidget {
  final Seat seat;
  final void Function()? onTap;

  GeneralSeatComponet({
    super.key,
    required this.seat,
    required this.onTap,
  });

  @override
  State<GeneralSeatComponet> createState() => _GeneralSeatComponetState();
}

class _GeneralSeatComponetState extends State<GeneralSeatComponet> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.seat.status == 0) {
            isSelected = true;
          } else {
            return;
          }
        });
        widget.onTap?.call();
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.dangChon // Đổi màu khi ghế được chọn
              : widget.seat.status == 0
                  ? AppColor.trong
                  : AppColor.daMua,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            widget.seat.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
