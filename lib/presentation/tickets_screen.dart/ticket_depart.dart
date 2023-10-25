import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';
import 'package:tdc_coach_user/presentation/detail_ticket.dart/detail_ticket.dart';
import 'package:tdc_coach_user/presentation/tickets_screen.dart/component/ticket_item_widget.dart';

class TicketDepart extends StatefulWidget {
  const TicketDepart({super.key});

  @override
  State<TicketDepart> createState() => _TicketDepartState();
}

class _TicketDepartState extends State<TicketDepart> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Query database;

  @override
  void initState() {
    super.initState();
    database = FirebaseDatabase.instance
        .ref()
        .child('booking')
        .child(auth.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      defaultChild: Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
        ),
      ),
      query: database,
      itemBuilder: (context, snapshot, animation, index) {
        String id = snapshot.child('id').value.toString();
        String userId = snapshot.child('userId').value.toString();
        String userName = snapshot.child('userName').value.toString();
        String userPhone = snapshot.child('userPhone').value.toString();
        String tripId = snapshot.child('tripId').value.toString();
        String seatId = snapshot.child('seatId').value.toString();
        String seatName = snapshot.child('seatName').value.toString();
        String seatCode = snapshot.child('seatCode').value.toString();
        String price = snapshot.child('price').value.toString();
        String departureLocation =
            snapshot.child('departureLocation').value.toString();
        String destinationLocation =
            snapshot.child('destinationLocation').value.toString();
        String departureTime = snapshot.child('departureTime').value.toString();
        String departureDate = snapshot.child('departureDate').value.toString();
        String status = snapshot.child('status').value.toString();
        String createdAt = snapshot.child('createdAt').value.toString();
        Booking booking = Booking(
          id: id,
          userId: userId,
          userName: userName,
          userPhone: userPhone,
          tripId: tripId,
          seatId: seatId,
          seatName: seatName,
          seatCode: int.parse(seatCode),
          price: int.parse(price),
          departureLocation: departureLocation,
          destinationLocation: destinationLocation,
          departureDate: departureDate,
          departureTime: departureTime,
          status: int.parse(status),
          createdAt: createdAt,
        );
        if (booking.status == 0) {
          return TicketItem(
            booking: booking,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTicket(
                    booking: booking,
                    onTap: () {
                      print('Hello');
                    },
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
