import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';
import 'package:tdc_coach_user/presentation/payment_detail_ticket/payment_detail_ticket.dart';
import 'package:tdc_coach_user/presentation/select_seat/component/seat_component.dart';

class SelectSeat extends StatefulWidget {
  final Trip trip;
  const SelectSeat({
    super.key,
    required this.trip,
  });

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  //
  late DatabaseReference database =
      FirebaseDatabase.instance.ref().child('seats').child(widget.trip.carId);
  int selectedCount = 0;
  //Seat seat = Seat(id: 'seat1', name: 'A01', status: 0);
  //
  Seat seatChoose = Seat.empty();
  bool isOccupied = false;
  Color getColorForSeat(Seat seat) {
    return seat.getStatus == 0 ? AppColor.trong : AppColor.daMua;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primary,
        title: Text(widget.trip.carId),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 26),
                width: 48,
                height: 48,
                child: Icon(Icons.two_wheeler),
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: StreamBuilder(
                stream: database.onValue,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    //
                    Map<dynamic, dynamic>? seatData =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
                    if (seatData == null) {
                      return const Center(child: Text('No data available'));
                    }
                    List<Seat> seats = [];
                    seatData.forEach((key, value) {
                      Map<dynamic, dynamic> seatInfo =
                          value as Map<dynamic, dynamic>;
                      String id = seatInfo['id'];
                      String name = seatInfo['name'];
                      int status = seatInfo['status'];
                      String userId = seatInfo['userId'];
                      Seat seat = Seat(
                        id: id,
                        name: name,
                        status: status,
                        userId: userId,
                      );
                      seats.add(seat);
                    });
                    //
                    return GridView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 45,
                      ),
                      itemBuilder: (context, index) {
                        final seat = seats[index];
                        return GeneralSeatComponet(
                          seat: seat,
                          isOccupied: isOccupied,
                          onTap: () {
                            if (!isOccupied) {
                              setState(() {
                                isOccupied = true;
                                selectedCount++;
                              });
                              seatChoose = seat;
                              print(seatChoose.getName);
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.trong,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Trống',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.dangChon,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Đang chọn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.daMua,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Đã mua',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Số lượng: $selectedCount/1",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: selectedCount == 0
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PayMentDetailTicket(
                                  trip: widget.trip,
                                  seat: seatChoose,
                                ),
                              ),
                            );
                          },
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: selectedCount == 0
                            ? Colors.grey[300]
                            : AppColor.primary,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          "Tiếp tục",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
