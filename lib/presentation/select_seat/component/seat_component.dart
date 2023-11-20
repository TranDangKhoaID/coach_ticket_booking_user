import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/presentation/select_seat/controller/select_seat_controller.dart';

// ignore: must_be_immutable
class GeneralSeatComponet extends StatefulWidget {
  final Seat seat;
  void Function()? onTap;

  GeneralSeatComponet({
    super.key,
    required this.seat,
    required this.onTap,
  });

  @override
  State<GeneralSeatComponet> createState() => _GeneralSeatComponetState();
}

class _GeneralSeatComponetState extends State<GeneralSeatComponet> {
  Color? color;
  @override
  void initState() {
    super.initState();
    if (widget.seat.status == 0) {
      color = AppColor.trong;
    } else {
      color = AppColor.daMua;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
