import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';

// ignore: must_be_immutable
class GeneralSeatComponet extends StatefulWidget {
  final Seat seat;
  bool isOccupied;
  void Function()? onTap;

  GeneralSeatComponet({
    super.key,
    required this.seat,
    required this.isOccupied,
    this.onTap,
  });

  @override
  State<GeneralSeatComponet> createState() => _GeneralSeatComponetState();
}

class _GeneralSeatComponetState extends State<GeneralSeatComponet> {
  late Color color;

  @override
  void initState() {
    super.initState();
    // Khởi tạo giá trị color dựa trên seat.status và isOccupied
    if (widget.seat.getStatus == 0 && widget.isOccupied) {
      color = AppColor.dangChon;
    } else if (widget.seat.getStatus == 0 && !widget.isOccupied) {
      color = AppColor.trong;
    } else {
      color = AppColor.daMua;
    }
  }

  void updateColor() {
    setState(() {
      if (widget.seat.getStatus == 0 && widget.isOccupied) {
        color = AppColor.dangChon;
      } else if (widget.seat.getStatus == 0 && !widget.isOccupied) {
        color = AppColor.trong;
      } else {
        color = AppColor.daMua;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateColor();
        widget.onTap?.call();
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            widget.seat.getName,
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
