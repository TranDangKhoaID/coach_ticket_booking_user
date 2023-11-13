import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/constants/top_up_constants.dart';
import 'package:tdc_coach_user/domain/model/top_up.dart';

class TopUpController extends GetxController {
  static TopUpController get instance => Get.find();

  DatabaseReference db = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;

  var dropDownvalue = 'momo'.obs;
  var paymentMethod = TopUpStrings.paymentMethodMomo.obs;
  var accountNumber = TopUpStrings.accountNumberMomo.obs;
  var accountOwner = TopUpStrings.accountOwnerMomo.obs;

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      dropDownvalue.value = selectedValue;
    }
    //print(dropDownvalue.value);
  }

  Future<void> addPayAccount(
    String price,
    String phone,
    String payContent,
  ) async {
    EasyLoading.show(status: AppString.loading);
    try {
      if (!dropDownvalue.value.endsWith('momo')) {
        paymentMethod.value = TopUpStrings.paymentMethodBank;
        accountNumber.value = TopUpStrings.accountNumberBank;
        accountOwner.value = TopUpStrings.accountOwnerBank;
      }
      if (price.isEmpty) {
        EasyLoading.showError('Bạn phải nhập số tiền');
        return;
      }
      if (price.length > 11 || price.length < 6) {
        EasyLoading.showError('Số từ 10.000 đến 100 triệu');
        return;
      }
      String idTopUp = 'top_up${db.child('top_ups').push().key}';
      final topUp = TopUp(
        id: idTopUp,
        idUser: auth.currentUser!.uid,
        phoneUser: phone,
        paymentMethod: paymentMethod.value,
        accountNumber: accountNumber.value,
        accountOwner: accountOwner.value,
        payContent: payContent,
        status: 0,
      );
      await db.child('top_ups').child(idTopUp).set(topUp.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Nạp thành công, vui lòng đợi admin duyệt!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
