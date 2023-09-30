import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  void signIn(String email, String password) async {
    emit(LoadingLoginState());

    try {
      // Thực hiện đăng nhập tại đây và kiểm tra kết quả
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SuccessLoginState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorLoginState(errorMessage: e.code));
    }
  }
}
