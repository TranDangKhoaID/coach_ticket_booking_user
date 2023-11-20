import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';

class ListTripController extends GetxController {
  static ListTripController get instance => Get.find();
  final DatabaseReference dbCar = FirebaseDatabase.instance.ref();
  //car
  var nameCar = 'Loading'.obs;
  //location
  var departure = 'Loading...'.obs;
  var destination = 'Loading...'.obs;
  //seat
  var seatCount = 0.obs;
  var seatList = <Seat>[].obs;
  Future<void> fetchCarName(String carId) async {
    final snapshotCar =
        await dbCar.child('cars').child(carId).child('name').get();
    nameCar.value = snapshotCar.value.toString();
  }

  Future<void> fetchLocation(String departId, String desId) async {
    final snapshotDepart =
        await dbCar.child('locations').child(departId).child('address').get();
    final snapshotDes =
        await dbCar.child('locations').child(desId).child('address').get();
    departure.value = snapshotDepart.value.toString();
    destination.value = snapshotDes.value.toString();
  }
}
