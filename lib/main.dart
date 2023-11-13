import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/app.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/firebase_options.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/list_trip/controller/list_trip_controller.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_controller.dart';
import 'package:tdc_coach_user/presentation/payment_detail_ticket/controller/payment_ticket_controller.dart';
import 'package:tdc_coach_user/presentation/register/cubit/register_controller.dart';
import 'package:tdc_coach_user/presentation/select_seat/controller/select_seat_controller.dart';
import 'package:tdc_coach_user/presentation/tickets_screen/controller/ticket_controller.dart';
import 'package:tdc_coach_user/presentation/top_up/controller/top_up_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppShared.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoginController());
  Get.put(RegisterController());
  Get.put(HomePageController());
  Get.put(ListTripController());
  Get.put(SelectSeatController());
  Get.put(PaymentTicketController());
  Get.put(TicketController());
  Get.put(TopUpController());
  runApp(const MyApp());
}
