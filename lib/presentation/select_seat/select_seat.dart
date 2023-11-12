import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';
import 'package:tdc_coach_user/presentation/list_trip/controller/list_trip_controller.dart';
import 'package:tdc_coach_user/presentation/payment_detail_ticket/payment_detail_ticket.dart';
import 'package:tdc_coach_user/presentation/select_seat/component/seat_component.dart';
import 'package:tdc_coach_user/presentation/select_seat/controller/select_seat_controller.dart';

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

  @override
  void initState() {
    super.initState();
    SelectSeatController.instance.seatCount.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primary,
        title: Text(ListTripController.instance.nameCar.value),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 26),
                width: 48,
                height: 48,
                child: const Icon(Icons.lightbulb_circle_outlined),
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
                      int code = seatInfo['code'];
                      int status = seatInfo['status'];
                      String userPhone = seatInfo['userPhone'];
                      Seat seat = Seat(
                        id: id,
                        name: name,
                        code: code,
                        status: status,
                        userPhone: userPhone,
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
                          onTap: () {
                            SelectSeatController.instance.selectSeat(seat);
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
                const Text(
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
                const Text(
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
                const Text(
                  'Đã mua',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
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
                Obx(
                  () => Text(
                    "Số lượng: ${SelectSeatController.instance.seatCount.value}/1",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: SelectSeatController.instance.seatCount.value == 0
                          ? null
                          : () {
                              Get.to(
                                () => PayMentDetailTicket(
                                  trip: widget.trip,
                                  seat: SelectSeatController
                                      .instance.seatChoose.value,
                                ),
                              );
                            },
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color:
                              SelectSeatController.instance.seatCount.value == 0
                                  ? Colors.grey[300]
                                  : AppColor.primary,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: const Center(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
