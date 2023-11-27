import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/presentation/account/account_top_ups.dart';
import 'package:tdc_coach_user/presentation/account/component/account_signout_widget.dart';
import 'package:tdc_coach_user/presentation/account/component/account_top_up_widget.dart';
import 'package:tdc_coach_user/presentation/account/component/account_update_widget.dart';
import 'package:tdc_coach_user/presentation/account/component/infor_user_widget.dart';
import 'package:tdc_coach_user/presentation/account/controlller/account_controller.dart';

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
  final _controllerFullName = TextEditingController();
  final _controllerPhone = TextEditingController();
  //đăng xuất
  void signOut(BuildContext context) {
    AppPreferences.instance.logout();
    FirebaseAuth.instance.signOut();
  }

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
        title: const Text('Tài khoản'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      onTapUpdateFullName: () {
                        _controllerFullName.text = fullName;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nhập họ tên',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: _controllerFullName,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DialogHelper.showConfirmDialog(
                                        context: context,
                                        onPressConfirm: () {
                                          AccountController.instance
                                              .updateFullName(
                                            userID: id,
                                            fullName:
                                                _controllerFullName.text.trim(),
                                          );
                                        },
                                        message: 'Xác nhận đổi tên?',
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Xác nhận',
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      onTapUpdatePhone: () {
                        _controllerPhone.text = phone;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nhập số điện thoại',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _controllerPhone,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DialogHelper.showConfirmDialog(
                                        context: context,
                                        onPressConfirm: () {
                                          AccountController.instance
                                              .updatePhone(
                                            userID: id,
                                            phone: _controllerPhone.text.trim(),
                                          );
                                        },
                                        message: 'Xác nhận đổi tên?',
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Xác nhận',
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    AccountTopUpWidget(
                      onTap: () {
                        Get.to(() => AccountTopUps());
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // AccountUpdateWidget(
                    //   onUpdate: () {},
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    AccountSignoutWidget(
                      onSignOut: () {
                        DialogHelper.showConfirmDialog(
                          context: context,
                          onPressConfirm: () {
                            signOut(context);
                          },
                          message: 'Xác nhận đăng xuất ?',
                        );
                      },
                    )
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
