import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/list_trip/component/trip_item.dart';
import 'package:tdc_coach_user/presentation/list_trip/controller/list_trip_controller.dart';
import 'package:tdc_coach_user/presentation/select_seat/select_seat.dart';

class ListTripScreen extends StatefulWidget {
  final String filterDepartureDate;
  final String filterDepartureLocation;
  final String filterDestinationLocation;
  const ListTripScreen({
    super.key,
    required this.filterDepartureDate,
    required this.filterDepartureLocation,
    required this.filterDestinationLocation,
  });

  @override
  State<ListTripScreen> createState() => _ListTripScreenState();
}

class _ListTripScreenState extends State<ListTripScreen> {
  final DatabaseReference db = FirebaseDatabase.instance.ref().child('trips');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primary,
        title: const Text('Danh sách chuyến'),
      ),
      body: Column(
        children: [
          tripContentBar(),
          const Divider(),
          Expanded(
            child: FirebaseAnimatedList(
              defaultChild: const Center(
                child: CircularProgressIndicator(),
              ),
              query: db,
              itemBuilder: (context, snapshot, animation, index) {
                String id = snapshot.child('id').value.toString();
                String departureDate =
                    snapshot.child('departureDate').value.toString();
                String departureId =
                    snapshot.child('departureLocation').value.toString();
                String destinationId =
                    snapshot.child('destinationLocation').value.toString();
                String departureTime =
                    snapshot.child('departureTime').value.toString();
                String destinationTime =
                    snapshot.child('destinationTime').value.toString();
                String price = snapshot.child('price').value.toString();
                String driverId = snapshot.child('driverId').value.toString();
                String carId = snapshot.child('carId').value.toString();

                if (departureDate == widget.filterDepartureDate &&
                    departureId == widget.filterDepartureLocation &&
                    destinationId == widget.filterDestinationLocation) {
                  ListTripController.instance.fetchCarName(carId);
                  ListTripController.instance
                      .fetchLocation(departureId, destinationId);
                  Trip trip = Trip(
                    id: id,
                    departureDate: departureDate,
                    departureLocation: departureId,
                    destinationLocation: destinationId,
                    departureTime: departureTime,
                    destinationTime: destinationTime,
                    price: int.parse(price),
                    driverId: driverId,
                    carId: carId,
                  );
                  return Obx(
                    () => TripItem(
                      trip: trip,
                      carName: ListTripController.instance.nameCar.value,
                      onTap: () {
                        Get.to(
                          () => SelectSeat(
                            trip: trip,
                          ),
                        );
                      },
                      departure: ListTripController.instance.departure.value,
                      destination:
                          ListTripController.instance.destination.value,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget tripContentBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 64,
      color: AppColor.primary,
      child: Row(
        children: [
          Text(
            HomePageController.instance.selectedDeparture.value,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.arrow_right_alt,
            color: AppColor.white,
          ),
          Text(
            HomePageController.instance.selectedDestination.value,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
