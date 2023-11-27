import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  //init
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> updateFullName({
    required String userID,
    required String fullName,
  }) async {
    EasyLoading.show();
    try {
      await _database
          .child(FireBaseConstant.customers)
          .child(userID)
          .update({'fullName': fullName});
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Cập nhật thành công');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> updatePhone({
    required String userID,
    required String phone,
  }) async {
    EasyLoading.show();
    try {
      await _database
          .child(FireBaseConstant.customers)
          .child(userID)
          .update({'phone': phone});
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Cập nhật thành công');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
