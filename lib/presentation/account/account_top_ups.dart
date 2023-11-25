import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/top_up.dart';
import 'package:tdc_coach_user/presentation/account/component/account_top_up_detail.dart';
import 'package:tdc_coach_user/presentation/account/component/account_top_up_item.dart';

class AccountTopUps extends StatelessWidget {
  AccountTopUps({super.key});
  final Query db = FirebaseDatabase.instance.ref().child('top_ups');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử nạp tiền'),
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: FirebaseAnimatedList(
        query: db,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String idUser = snapshot.child('idUser').value.toString();
          String phoneUser = snapshot.child('phoneUser').value.toString();
          String paymentMethod =
              snapshot.child('paymentMethod').value.toString();
          String accountNumber =
              snapshot.child('accountNumber').value.toString();
          String accountOwner = snapshot.child('accountOwner').value.toString();
          String payContent = snapshot.child('payContent').value.toString();
          String creatAt = snapshot.child('creatAt').value.toString();
          String money = snapshot.child('money').value.toString();
          int status = snapshot.child('status').value as int;
          final topUp = TopUp(
            id: id,
            idUser: idUser,
            phoneUser: phoneUser,
            money: int.parse(money),
            paymentMethod: paymentMethod,
            accountNumber: accountNumber,
            accountOwner: accountOwner,
            payContent: payContent,
            creatAt: creatAt,
            status: status,
          );
          return AccountTopUpItem(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => PaymentItem(topUp: topUp),
                );
              },
              topUp: topUp);
        },
      ),
    );
  }
}
