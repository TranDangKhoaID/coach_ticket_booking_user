import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/presentation/detail_ticket/detail_ticket.dart';
import 'package:tdc_coach_user/presentation/tickets_screen/component/ticket_item_widget.dart';

class TicketHistory extends StatefulWidget {
  const TicketHistory({super.key});

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref();
  late Query dbBooking;

  @override
  void initState() {
    super.initState();
    dbBooking = database.child('bookings').child(auth.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      defaultChild: const Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
        ),
      ),
      query: dbBooking,
      itemBuilder: (context, snapshot, animation, index) {
        //booking
        String id = snapshot.child('id').value.toString();
        String userId = snapshot.child('userId').value.toString();
        String carId = snapshot.child('carId').value.toString();
        String userName = snapshot.child('userName').value.toString();
        String userPhone = snapshot.child('userPhone').value.toString();
        String tripId = snapshot.child('tripId').value.toString();
        String seatId = snapshot.child('seatId').value.toString();
        String price = snapshot.child('price').value.toString();
        String departureLocation =
            snapshot.child('departureLocation').value.toString();
        String destinationLocation =
            snapshot.child('destinationLocation').value.toString();
        String departurePoint =
            snapshot.child('departurePoint').value.toString();
        String departureTime = snapshot.child('departureTime').value.toString();
        String departureDate = snapshot.child('departureDate').value.toString();
        String status = snapshot.child('status').value.toString();
        String createdAt = snapshot.child('createdAt').value.toString();
        //seat
        int code = snapshot.child('seat').child('code').value as int;
        String name = snapshot.child('seat').child('name').value.toString();
        int seatStatus = snapshot.child('seat').child('status').value as int;
        Seat seat = Seat(
          id: seatId,
          name: name,
          code: code,
          status: seatStatus,
          userID: userId,
          userPhone: userPhone,
        );
        Booking booking = Booking(
          id: id,
          userId: userId,
          carId: carId,
          userName: userName,
          userPhone: userPhone,
          tripId: tripId,
          seatId: seatId,
          price: int.parse(price),
          departureLocation: departureLocation,
          destinationLocation: destinationLocation,
          departurePoint: departurePoint,
          departureDate: departureDate,
          departureTime: departureTime,
          status: int.parse(status),
          createdAt: createdAt,
          seat: seat,
        );
        // DateTime departureDateTime =
        //     DateFormat('dd/MM/yyyy').parse(booking.departureDate);
        // if (DateTime.now().isAfter(departureDateTime)) {
        //   TicketController.instance.updateStatusTicket(
        //     database,
        //     userId,
        //     tripId,
        //   );
        // }
        if (booking.status != 0) {
          return TicketItem(
            booking: booking,
            onTap: () {
              Get.to(
                () => DetailTicket(
                  booking: booking,
                  onTap: null,
                  createAt: booking.createdAt,
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
