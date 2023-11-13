import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';

class TicketItem extends StatelessWidget {
  final Booking booking;
  final void Function()? onTap;
  const TicketItem({
    super.key,
    required this.booking,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[300],
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text(
                    'Giờ xuất bến',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    booking.departureTime,
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColor.primary,
                    ),
                  ),
                  Text(
                    booking.departureDate,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    booking.status == 0
                        ? 'Sắp khởi hành'
                        : (booking.status == 1 ? 'Hoàn thành' : 'Hủy'),
                    style: TextStyle(
                      fontSize: 11,
                      color: booking.status == 0
                          ? AppColor.primary
                          : (booking.status == 1 ? Colors.green : Colors.red),
                    ),
                  )
                ],
              ),
            ),
            dottedLineTicket(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle_notifications),
                      Text(
                        booking.departureLocation,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                      Text(
                        booking.destinationLocation,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Ghế: ',
                      ),
                      Text(
                        ' ${booking.seatName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column dottedLineTicket() {
    return Column(
      children: [
        Container(
          width: 20,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.centerLeft,
          height: 120,
          child: const DottedLine(
            direction: Axis.vertical,
            dashColor: Colors.grey,
          ),
        ),
        Container(
          width: 20,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
