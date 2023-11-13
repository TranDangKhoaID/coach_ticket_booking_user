import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';

class TicketController extends GetxController {
  static TicketController get instance => Get.find();

  Future<void> cancelTicket(
    DatabaseReference database,
    String userId,
    String tripId,
    String carId,
    String seatId,
    int price,
  ) async {
    EasyLoading.show(status: AppString.loading);
    try {
      //update booking
      await database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .update({'status': 2});
      //update seat
      await database.child('seats').child(carId).child(seatId).update({
        'status': 0,
        'userPhone': "",
      });
      //update wallet
      DataSnapshot snapshotWallet = await database
          .child(FireBaseConstant.customers)
          .child(userId)
          .child('wallet')
          .get();
      final int wallet = snapshotWallet.value as int;
      final int updateWallet = wallet + price;
      await database.child(FireBaseConstant.customers).child(userId).update({
        'wallet': updateWallet,
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Hủy thành công');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> updateStatusTicket(
    DatabaseReference database,
    String userId,
    String tripId,
  ) async {
    try {
      await database
          .child('bookings')
          .child(userId)
          .child(tripId)
          .update({'status': 1});
      EasyLoading.showSuccess('Cập nhật vé!');
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
