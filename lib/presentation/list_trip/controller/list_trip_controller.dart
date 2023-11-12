import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ListTripController extends GetxController {
  static ListTripController get instance => Get.find();
  final DatabaseReference dbCar = FirebaseDatabase.instance.ref();

  var nameCar = 'Loading'.obs;

  Future<void> fetchCarName(String carId) async {
    final DataSnapshot snapshotCar =
        await dbCar.child('cars').child(carId).child('name').get();

    nameCar.value = snapshotCar.value.toString();
  }
}
