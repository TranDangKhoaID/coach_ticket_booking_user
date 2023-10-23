import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';
import 'package:tdc_coach_user/presentation/list_trip.dart/component/trip_item.dart';
import 'package:tdc_coach_user/presentation/select_seat/select_seat.dart';

class ListTripScreen extends StatefulWidget {
  final String filterDepartureDate;
  final String? filterDepartureLocation;
  final String? filterDestinationLocation;
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
  Query database = FirebaseDatabase.instance.ref().child('trips');
  late Query filteredQuery;
  //khai bao danh sach chuyen
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
          TripContentBar(),
          //TripSearchBar(),
          const Divider(),
          Expanded(
            child: FirebaseAnimatedList(
              defaultChild: const Center(
                child: CircularProgressIndicator(),
              ),
              query: database,
              itemBuilder: (context, snapshot, animation, index) {
                String id = snapshot.child('id').value.toString();
                String departureDate =
                    snapshot.child('departureDate').value.toString();
                String departureLocation =
                    snapshot.child('departureLocation').value.toString();
                String destinationLocation =
                    snapshot.child('destinationLocation').value.toString();
                if (departureDate == widget.filterDepartureDate &&
                    departureLocation == widget.filterDepartureLocation &&
                    destinationLocation == widget.filterDestinationLocation) {
                  String departureTime =
                      snapshot.child('departureTime').value.toString();
                  String destinationTime =
                      snapshot.child('destinationTime').value.toString();
                  String price = snapshot.child('price').value.toString();
                  String driverId = snapshot.child('driverId').value.toString();
                  String carId = snapshot.child('carId').value.toString();

                  Trip trip = Trip(
                    id: id,
                    departureDate: departureDate,
                    departureLocation: departureLocation,
                    destinationLocation: destinationLocation,
                    departureTime: departureTime,
                    destinationTime: destinationTime,
                    price: int.parse(price),
                    driverId: driverId,
                    carId: carId,
                  );
                  return TripItem(
                    trip: trip,
                    carName: carId,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectSeat(
                            trip: trip,
                          ),
                        ),
                      );
                    },
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

  Container TripContentBar() {
    return Container(
      height: 64,
      color: Colors.blue,
    );
  }

  Container TripSearchBar() {
    return Container(
      margin: EdgeInsets.all(16),
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_outlined,
            ),
          ),
          Text(
            "Tìm kiếm",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
