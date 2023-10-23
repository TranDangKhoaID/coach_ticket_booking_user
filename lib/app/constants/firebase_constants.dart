import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBaseConstant {
  FireBaseConstant._();
  //auth
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String userId = auth.currentUser!.uid;
  //database
  static DatabaseReference database = FirebaseDatabase.instance.ref();
  //strings
  static const customers = 'customers';
  static const fullNameCustomer = 'fullName';
  static const phoneCustomer = 'phone';
  static const emailCustomer = 'email';
  static const walletCustomer = 'wallet';
}
