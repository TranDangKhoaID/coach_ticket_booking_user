import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/domain/model/booking.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';
import 'package:tdc_coach_user/presentation/widgets/body_page.dart';

class PaymentTicketController extends GetxController {
  static PaymentTicketController get instance => Get.find();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String dateNow = DateFormat('HH:mm dd/MM/yyyy').format(DateTime.now());

  //location
  var departure = 'Loading...'.obs;
  var destination = 'Loading...'.obs;
  var departPoint = 'Loading...'.obs;

  Future<void> fetchLocation(String departId, String desId) async {
    final snapshotDepart =
        await _database.child('locations').child(departId).child('name').get();
    final snapshotDestination =
        await _database.child('locations').child(desId).child('name').get();
    final snapshotPoint = await _database
        .child('locations')
        .child(departId)
        .child('address')
        .get();
    departure.value = snapshotDepart.value.toString();
    destination.value = snapshotDestination.value.toString();
    departPoint.value = snapshotPoint.value.toString();
  }

  Future<void> addBooking(
      {required String userId,
      required String carId,
      required String userName,
      required String userPhone,
      required String tripId,
      required String seatId,
      required int price,
      required String departureDate,
      required String departureTime,
      required int status,
      required int wallet}) async {
    EasyLoading.show(status: AppString.loading);
    try {
      String bookingId =
          'booking${_database.child('bookings').child(tripId).push().key}';
      int updateWallet = wallet - price;

      //check trip id
      final DataSnapshot snapshot = await _database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .child('status')
          .get();
      final DataSnapshot snapshotSeatStatus = await _database
          .child('seats')
          .child(carId)
          .child(seatId)
          .child('status')
          .get();
      final DataSnapshot snapshotSeatCode = await _database
          .child('seats')
          .child(carId)
          .child(seatId)
          .child('code')
          .get();
      final DataSnapshot snapshotSeatName = await _database
          .child('seats')
          .child(carId)
          .child(seatId)
          .child('name')
          .get();
      if (snapshotSeatStatus.value == 1) {
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
      final seat = Seat(
        id: seatId,
        name: snapshotSeatName.value.toString(),
        code: int.parse(snapshotSeatCode.value.toString()),
        status: int.parse(snapshotSeatStatus.value.toString()),
        userID: userId,
        userPhone: userPhone,
      );
      final booking = Booking(
        id: bookingId,
        userId: userId,
        carId: carId,
        userName: userName,
        userPhone: userPhone,
        tripId: tripId,
        seatId: seatId,
        price: price,
        departureLocation: departure.value,
        destinationLocation: destination.value,
        departurePoint: departPoint.value,
        departureDate: departureDate,
        departureTime: departureTime,
        status: status,
        createdAt: dateNow,
        seat: seat,
      );
      await _database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .set(booking.toJson());

      await _database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .child('seat')
          .set(seat.toJson());
      //update wallet
      await _database
          .child(FireBaseConstant.customers)
          .child(userId)
          .update({'wallet': updateWallet});

      //update seat
      await _database.child('seats').child(carId).child(seatId).update({
        'status': 1,
        'userPhone': userPhone,
        'userID': userId,
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thanh toán thành công');
      Get.offAll(() => const BodyPage());
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
