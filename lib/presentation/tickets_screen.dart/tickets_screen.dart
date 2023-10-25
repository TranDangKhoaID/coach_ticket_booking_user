import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/tickets_screen.dart/ticket_depart.dart';
import 'package:tdc_coach_user/presentation/tickets_screen.dart/ticket_history.dart';

class HistoryTicketScreen extends StatelessWidget {
  const HistoryTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primary,
          title: Text('Danh sách vé'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Sắp khởi hành'),
              ),
              Tab(
                child: Text('Lịch sử vé'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TicketDepart(),
            TicketHistory(),
          ],
        ),
      ),
    );
  }
}
