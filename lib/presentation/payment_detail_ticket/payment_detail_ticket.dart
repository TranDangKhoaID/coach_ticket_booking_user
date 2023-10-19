import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';

class PayMentDetailTicket extends StatelessWidget {
  final Trip trip;
  final Seat seat;
  const PayMentDetailTicket({
    super.key,
    required this.trip,
    required this.seat,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết vé'),
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColor.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin hành khách',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Họ tên',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppPreferences.instance.getFullName() ?? 'Khách Hàng',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppPreferences.instance.getPhone() ?? 'Lỗi',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppPreferences.instance.getEmail() ?? 'Lỗi',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: AppColor.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Tuyến xe',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            trip.departureLocation,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_right),
                          Text(
                            trip.destinationLocation,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Thời gian',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        trip.departureDate,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Số ghế',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        seat.getName,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng tiền',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        trip.price.toString(),
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
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: AppColor.white,
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
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
                        Spacer(),
                        Text(
                          trip.price.toString(),
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phí thanh toán',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                        ),
                        Spacer(),
                        Text(
                          '0 đ',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          trip.price.toString(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                        )),
                        Spacer(),
                        Text(
                          '190000 đ',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Center(
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
}
