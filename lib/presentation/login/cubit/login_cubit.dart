import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  void signIn(String email, String password) async {
    emit(LoadingLoginState());

    try {
      // Thực hiện đăng nhập tại đây và kiểm tra kết quả
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // Thực hiện đăng nhập tại đây và kiểm tra kết quả
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Lấy UID của người dùng đã đăng nhập
      String uid = userCredential.user!.uid;
      // Kiểm tra UID trong cơ sở dữ liệu thời gian thực
      DatabaseReference _ref = FireBaseConstant.database
          .child(FireBaseConstant.customers)
          .child(uid);

      // Lắng nghe sự thay đổi dữ liệu
      _ref.onValue.listen((event) {
        // Ép kiểu dữ liệu snapshot.value thành Map<dynamic, dynamic>
        Map<dynamic, dynamic>? customerData =
            event.snapshot.value as Map<dynamic, dynamic>?;

        if (customerData != null) {
          String fullName =
              customerData[FireBaseConstant.fullNameCustomer] as String;
          String phone = customerData[FireBaseConstant.phoneCustomer] as String;
          String email = customerData[FireBaseConstant.emailCustomer] as String;
          int wallet = customerData[FireBaseConstant.walletCustomer] as int;

          // Lưu thông tin vào local
          AppPreferences.instance.saveFullName(fullName);
          AppPreferences.instance.savePhone(phone);
          AppPreferences.instance.saveUserID(uid);
          AppPreferences.instance.saveEmail(email);
          AppPreferences.instance.saveWallet(wallet);
        } else {
          // Node không tồn tại
          print('Không tìm thấy thông tin người dùng');
        }
      });

      emit(SuccessLoginState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginState(errorMessage: e.code));
    }
  }
}
