import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/presentation/account/component/infor_user_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  DatabaseReference? dbCustomer;
  String? userId;
  @override
  void initState() {
    super.initState();
    userId = auth.currentUser!.uid;
    dbCustomer = database.child(FireBaseConstant.customers).child(userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text('Tài khoản'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: StreamBuilder(
            stream: dbCustomer!.onValue,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                );
              } else {
                String fullName =
                    snapshot.data!.snapshot.child('fullName').value.toString();
                String id =
                    snapshot.data!.snapshot.child('id').value.toString();
                String email =
                    snapshot.data!.snapshot.child('email').value.toString();
                String phone =
                    snapshot.data!.snapshot.child('phone').value.toString();

                return Column(
                  children: [
                    iconPersonRounded(),
                    InForUserWidget(
                      fullName: fullName,
                      email: email,
                      phone: phone,
                      onSignOut: () {},
                      onUpdate: () {},
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget iconPersonRounded() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: AppColor.primary,
          width: 1,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.person,
          color: AppColor.primary,
          size: 80,
        ),
      ),
    );
  }
}
