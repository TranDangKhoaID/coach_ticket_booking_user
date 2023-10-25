import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';

class DetailTicket extends StatefulWidget {
  final Booking booking;
  final void Function()? onTap;
  const DetailTicket({
    super.key,
    required this.booking,
    required this.onTap,
  });
  @override
  State<DetailTicket> createState() => _DetailTicketState();
}

class _DetailTicketState extends State<DetailTicket> {
  String email = AppPreferences.instance.getEmail() ?? '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: Text('Thông tin vé'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
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
                        widget.booking.userName,
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
                        widget.booking.userPhone,
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
                        email,
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
                        color: Colors.green[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('Mã QR'),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.booking.seatCode.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Ghế: ${widget.booking.seatName}'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Giá: ${widget.booking.price} đ')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trạng thái',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.booking.status == 0
                            ? 'Sắp khởi hành'
                            : (widget.booking.status == 1
                                ? 'Hoàn thành'
                                : 'Hủy'),
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.booking.status == 0
                              ? AppColor.primary
                              : (widget.booking.status == 1
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tuyến xe',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.booking.departureLocation,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_right),
                          Text(
                            widget.booking.destinationLocation,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thời gian',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.booking.departureDate,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số ghế',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.booking.seatName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                                widget.booking.price.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
                                'Thanh toán',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[600],
                                ),
                              )),
                              Spacer(),
                              Text(
                                widget.booking.price.toString(),
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
            )
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
                    onTap: widget.booking.status == 0 ? widget.onTap : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.booking.status == 0
                            ? AppColor.primary
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          "Hủy vé",
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
        Spacer(),
        Text(
          '0 đ',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
