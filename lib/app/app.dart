import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_user/app/auth/auth.dart';
import 'package:tdc_coach_user/presentation/payment_detail_ticket/payment_detail_ticket.dart';
import 'package:tdc_coach_user/presentation/select_seat/select_seat.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PayMentDetailTicket(),
      builder: EasyLoading.init(),
    );
  }
}
