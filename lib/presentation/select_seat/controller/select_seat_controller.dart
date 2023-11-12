import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/seat.dart';

class SelectSeatController extends GetxController {
  static SelectSeatController get instance => Get.find();

  var seatCount = 0.obs;
  var seatChoose = Seat.empty().obs;
  var colorDangChon = AppColor.dangChon.obs;

  void selectSeat(Seat seat) {
    if (seat.getStatus == 0) {
      seatCount.value = 1;
      seatChoose.value = seat;
    }
  }
}
