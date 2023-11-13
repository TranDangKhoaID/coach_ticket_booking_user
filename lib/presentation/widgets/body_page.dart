import 'package:flutter/material.dart';
import 'package:tdc_coach_user/presentation/account/account_screen.dart';
import 'package:tdc_coach_user/presentation/tickets_screen/tickets_screen.dart';
import 'package:tdc_coach_user/presentation/home_page/home_page_screen.dart';
import 'package:tdc_coach_user/presentation/widgets/bottom_navigation_bar.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  //navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //home page
    const HomePage(),
    //history ticket page
    const HistoryTicketScreen(),
    //account page
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
