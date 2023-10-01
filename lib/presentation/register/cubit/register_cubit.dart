import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdc_coach_user/domain/model/user.dart';

import 'package:tdc_coach_user/presentation/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  RegisterCubit() : super(RegisterState.initial());

  // Sign up
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String wallet,
  }) async {
    emit(RegisterState.submitting());

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //emit
      emit(RegisterState.success());
      // Add user to database
      final user = Customer(
        id: userCredential.user!.uid,
        fullName: fullName,
        email: email,
        phone: phone,
        wallet: int.parse(wallet),
      );
      await _database
          .child('customers')
          .child(userCredential.user!.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.toString(); // Extract error message from Firebase
      emit(RegisterState.failure(errorMessage));
    }
  }
}
