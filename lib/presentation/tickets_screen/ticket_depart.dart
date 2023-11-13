import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';
import 'package:tdc_coach_user/presentation/detail_ticket/detail_ticket.dart';
import 'package:tdc_coach_user/presentation/tickets_screen/component/ticket_item_widget.dart';

class TicketDepart extends StatefulWidget {
  const TicketDepart({super.key});

  @override
  State<TicketDepart> createState() => _TicketDepartState();
}

class _TicketDepartState extends State<TicketDepart> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref();
  late Query dbBooking;

  @override
  void initState() {
    super.initState();
    dbBooking = database.child('booking').child(auth.currentUser!.uid);
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
        String id = snapshot.child('id').value.toString();
        String userId = snapshot.child('userId').value.toString();
        String carId = snapshot.child('carId').value.toString();
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
          carId: carId,
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
        DateTime departureDateTime =
            DateFormat('dd/MM/yyyy').parse(booking.departureDate);
        if (DateTime.now().isAfter(departureDateTime)) {
          database
              .child('booking')
              .child(userId)
              .child(tripId)
              .update({'status': 1});
          print('Cập nhật trạng thái');
        }
        if (booking.status == 0) {
          return TicketItem(
            booking: booking,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTicket(
                    booking: booking,
                    onTap: () async {
                      await database
                          .child('booking')
                          .child(userId)
                          .child(tripId)
                          .update({'status': 2});
                      await database
                          .child('seats')
                          .child(carId)
                          .child(seatId)
                          .update({
                        'status': 0,
                        'userPhone': "",
                      });
                      print('Hủy thành công');
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
