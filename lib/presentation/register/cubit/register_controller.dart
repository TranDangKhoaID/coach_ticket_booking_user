import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/domain/model/user.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required int wallet,
  }) async {
    EasyLoading.show(status: 'Đang tải');
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Add user to database
      final user = Customer(
        id: userCredential.user!.uid,
        fullName: fullName,
        email: email,
        phone: phone,
        wallet: wallet,
      );
      // Lưu thông tin vào local
      AppPreferences.instance.saveFullName(fullName);
      AppPreferences.instance.savePhone(phone);
      AppPreferences.instance.saveUserID(userCredential.user!.uid);
      AppPreferences.instance.saveEmail(email);
      AppPreferences.instance.saveWallet(wallet);
      await _database
          .child(FireBaseConstant.customers)
          .child(userCredential.user!.uid)
          .set(user.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Đăng nhập thành công!');
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.toString(); // Extract error message from Firebase
      EasyLoading.dismiss();
      EasyLoading.showError(errorMessage);
    }
  }
}
