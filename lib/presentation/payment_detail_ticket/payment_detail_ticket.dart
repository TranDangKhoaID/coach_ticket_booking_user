import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';
import 'package:tdc_coach_user/presentation/payment_detail_ticket/controller/payment_ticket_controller.dart';
import 'package:tdc_coach_user/presentation/widgets/error_dialog.dart';

class PayMentDetailTicket extends StatefulWidget {
  final Trip trip;
  final Seat seat;
  const PayMentDetailTicket({
    super.key,
    required this.trip,
    required this.seat,
  });

  @override
  State<PayMentDetailTicket> createState() => _PayMentDetailTicketState();
}

class _PayMentDetailTicketState extends State<PayMentDetailTicket> {
  //firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  String dateNow = DateFormat('HH:mm dd/MM/yyyy').format(DateTime.now());
  //infor trip
  String? tripId;
  String? carId;
  String? tripIdFirebase;
  String? seatId;
  String? seatName;
  int? seatCode;
  String? departureLocation;
  String? destinationLocation;
  String? departureDate;
  String? departureTime;
  int? price;
  String? formattedPrice;
  //infor user
  String? userId;
  String fullName = AppPreferences.instance.getFullName() ?? 'Khách hàng';
  String phone = AppPreferences.instance.getPhone()!;
  String email = AppPreferences.instance.getEmail()!;
  int? wallet;

  @override
  void initState() {
    super.initState();
    tripId = widget.trip.id;
    carId = widget.trip.carId;
    seatId = widget.seat.id;
    seatName = widget.seat.name;
    seatCode = widget.seat.code;
    userId = _auth.currentUser!.uid;
    departureLocation = widget.trip.departureLocation;
    destinationLocation = widget.trip.destinationLocation;
    departureDate = widget.trip.departureDate;
    departureTime = widget.trip.departureTime;
    price = widget.trip.price;
    formattedPrice =
        NumberFormat.currency(locale: 'vi', symbol: '').format(price);
  }

  @override
  Widget build(BuildContext context) {
    getWalletFirebase();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết vé'),
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: AppColor.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Thông tin hành khách',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Họ tên',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Số điện thoại',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                color: AppColor.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Thông tin lượt đi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Tuyến xe',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () {
                            PaymentTicketController.instance.fetchLocation(
                              departureLocation!,
                              destinationLocation!,
                            );
                            return Row(
                              children: [
                                Text(
                                  PaymentTicketController
                                      .instance.departure.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const Icon(Icons.arrow_right),
                                Text(
                                  PaymentTicketController
                                      .instance.destination.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Điểm lên xe',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () => Text(
                            PaymentTicketController.instance.departPoint.value,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Ngày xuất phát',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.trip.departureDate,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Số ghế',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.seat.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Tổng tiền',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$formattedPrice đ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                color: AppColor.white,
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Giá vé',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '$formattedPrice đ',
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      walletWidget(),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Thanh toán mặc định với ví',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[600],
                            ),
                          )),
                          const Spacer(),
                          Text(
                            '$formattedPrice đ',
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            elevation: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (wallet! >= price!) {
                          DialogHelper.showConfirmDialog(
                            context: context,
                            onPressConfirm: () {
                              PaymentTicketController.instance.addBooking(
                                userId: userId!,
                                carId: carId!,
                                userName: fullName,
                                userPhone: phone,
                                tripId: tripId!,
                                seatId: seatId!,
                                price: price!,
                                departureDate: departureDate!,
                                departureTime: departureTime!,
                                status: 0,
                                wallet: wallet!,
                              );
                            },
                            message: 'Xác nhận thanh toán ?',
                          );
                        } else {
                          DialogHelper.showErrorDialog(
                            'Bạn không đủ tiền',
                            context: context,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: const Center(
                          child: Text(
                            "Thanh toán",
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
      ),
    );
  }

  void getWalletFirebase() {
    database
        .child(FireBaseConstant.customers)
        .child(userId!)
        .child('wallet')
        .onValue
        .listen((event) {
      wallet = event.snapshot.value as int;
    });
  }

  Widget walletWidget() {
    return Row(
      children: [
        Text(
          'Phí thanh toán',
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        const Text(
          '0 đ',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
