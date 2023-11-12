import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';

class PaymentTicketController extends GetxController {
  static PaymentTicketController get instance => Get.find();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String dateNow = DateFormat('HH:mm dd/MM/yyyy').format(DateTime.now());

  //location
  var departure = 'Loading...'.obs;
  var destination = 'Loading...'.obs;

  Future<void> fetchLocation(String departId, String desId) async {
    final snapshotDepart =
        await _database.child('locations').child(departId).child('name').get();
    final snapshotDestination =
        await _database.child('locations').child(desId).child('name').get();
    departure.value = snapshotDepart.value.toString();
    destination.value = snapshotDestination.value.toString();
  }

  Future<void> addBooking(
      {required String userId,
      required String carId,
      required String userName,
      required String userPhone,
      required String tripId,
      required String seatId,
      required String seatName,
      required int seatCode,
      required int price,
      required String departureLocation,
      required String destinationLocation,
      required String departureDate,
      required String departureTime,
      required int status,
      required int wallet}) async {
    EasyLoading.show(status: AppString.loading);
    try {
      String bookingId =
          'booking${_database.child('bookings').child(tripId).push().key}';
      int updateWallet = wallet - price;
      final booking = Booking(
        id: bookingId,
        userId: userId,
        carId: carId,
        userName: userName,
        userPhone: userPhone,
        tripId: tripId,
        seatId: seatId,
        seatName: seatName,
        seatCode: seatCode,
        price: price,
        departureLocation: departureLocation,
        destinationLocation: destinationLocation,
        departureDate: departureDate,
        departureTime: departureTime,
        status: status,
        createdAt: dateNow,
      );
      //check trip id
      final DataSnapshot snapshot = await _database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .child('status')
          .get();
      final DataSnapshot snapshotSeatID = await _database
          .child('seats')
          .child(carId)
          .child(seatId)
          .child('status')
          .get();
      if (snapshotSeatID.value == 1) {
        EasyLoading.dismiss();
        EasyLoading.showError('Ghế này đã được đặt');
        return;
      }
      if (snapshot.value == 0) {
        EasyLoading.dismiss();
        EasyLoading.showError('Đã mua chuyến này');
        return;
      }
      //add booking
      await _database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .set(booking.toJson());
      //update wallet
      await _database
          .child(FireBaseConstant.customers)
          .child(userId)
          .update({'wallet': updateWallet});
      //update seat
      await _database.child('seats').child(carId).child(seatId).update({
        'status': 1,
        'userPhone': userPhone,
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thanh toán thành công');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
