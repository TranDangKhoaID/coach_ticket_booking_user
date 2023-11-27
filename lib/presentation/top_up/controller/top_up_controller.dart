import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/constants/top_up_constants.dart';
import 'package:tdc_coach_user/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_user/domain/model/top_up.dart';

class TopUpController extends GetxController {
  static TopUpController get instance => Get.find();

  DatabaseReference db = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;

  var dropDownvalue = 'momo'.obs;
  var paymentMethod = ''.obs;
  var accountNumber = ''.obs;
  var accountOwner = ''.obs;
  var payContent = ''.obs;
  var umoney = ''.obs;
  var confirmPay = false.obs;

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      dropDownvalue.value = selectedValue;
    }
  }

  void confirmPayMethod({
    required String phone,
    required String money,
    required BuildContext context,
  }) {
    if (money.isEmpty) {
      DialogHelper.showErrorDialog(
        'Bạn phải nhập số tiền',
        context: context,
      );
      return;
    }
    if (money.length > 10 || money.length < 5) {
      EasyLoading.showError('Số từ 10.000 đến 100 triệu');
      return;
    }
    String fmoney = formatCurrency(money);
    umoney.value = '${formatCurrency(money)} đ';
    if (dropDownvalue.endsWith('momo')) {
      paymentMethod.value = TopUpStrings.paymentMethodMomo;
      accountNumber.value = TopUpStrings.accountNumberMomo;
      accountOwner.value = TopUpStrings.accountOwnerMomo;
      payContent.value = 'nap $fmoney tdc coach vao $phone';
    } else {
      paymentMethod.value = TopUpStrings.paymentMethodBank;
      accountNumber.value = TopUpStrings.accountNumberBank;
      accountOwner.value = TopUpStrings.accountOwnerBank;
      payContent.value = 'nap $fmoney tdc coach vao $phone';
    }
    confirmPay.value = true;
  }

  Future<void> addPayAccount({
    required String money,
    required String phone,
  }) async {
    EasyLoading.show(status: AppString.loading);
    try {
      String idTopUp = 'top_up${db.child('top_ups').push().key}';
      String creatAt = DateFormat('HH:mm dd/MM/yyyy').format(DateTime.now());
      final topUp = TopUp(
        id: idTopUp,
        idUser: auth.currentUser!.uid,
        phoneUser: phone,
        money: int.parse(money),
        paymentMethod: paymentMethod.value,
        accountNumber: accountNumber.value,
        accountOwner: accountOwner.value,
        creatAt: creatAt,
        payContent: payContent.value,
        status: 0,
      );
      await db.child('top_ups').child(idTopUp).set(topUp.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Nạp thành công, vui lòng đợi admin duyệt!');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  String formatCurrency(String value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    try {
      int parsedValue = int.parse(value.replaceAll('.', ''));
      return formatter.format(parsedValue);
    } catch (e) {
      return value;
    }
  }
}
