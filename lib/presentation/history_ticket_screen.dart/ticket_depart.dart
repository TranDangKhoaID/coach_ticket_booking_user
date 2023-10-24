import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/history_ticket_screen.dart/component/ticket_item_widget.dart';

class TicketDepart extends StatelessWidget {
  const TicketDepart({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TicketItem(),
          TicketItem(),
          TicketItem(),
          TicketItem(),
        ],
      ),
    );
  }
}
