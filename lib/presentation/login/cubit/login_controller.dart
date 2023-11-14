import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    EasyLoading.show(status: 'Đang tải');
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Lấy UID của người dùng đã đăng nhập
      String uid = userCredential.user!.uid;
      // Kiểm tra UID trong cơ sở dữ liệu thời gian thực
      DatabaseReference ref = FireBaseConstant.database
          .child(FireBaseConstant.customers)
          .child(uid);
      // Lắng nghe sự thay đổi dữ liệu
      ref.onValue.listen(
        (event) {
          // Ép kiểu dữ liệu snapshot.value thành Map<dynamic, dynamic>
          Map<dynamic, dynamic>? customerData =
              event.snapshot.value as Map<dynamic, dynamic>?;

          if (customerData != null) {
            String fullName =
                customerData[FireBaseConstant.fullNameCustomer] as String;
            String phone =
                customerData[FireBaseConstant.phoneCustomer] as String;
            String email =
                customerData[FireBaseConstant.emailCustomer] as String;
            int wallet = customerData[FireBaseConstant.walletCustomer] as int;

            // Lưu thông tin vào local
            AppPreferences.instance.saveFullName(fullName);
            AppPreferences.instance.savePhone(phone);
            AppPreferences.instance.saveUserID(uid);
            AppPreferences.instance.saveEmail(email);
            AppPreferences.instance.saveWallet(wallet);
          } else {
            EasyLoading.dismiss();
            EasyLoading.showError('Không tìm thấy thông tin người dùng');
            auth.signOut();
            //print('Không tìm thấy thông tin người dùng');
            return;
          }
        },
      );
      EasyLoading.dismiss();
      //EasyLoading.showSuccess('Đăng')
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(
        e.toString(),
        duration: const Duration(seconds: 5),
        dismissOnTap: true,
      );
    }
  }
}
