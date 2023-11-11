import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/app.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/firebase_options.dart';
import 'package:tdc_coach_user/presentation/login/cubit/login_controller.dart';
import 'package:tdc_coach_user/presentation/register/cubit/register_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppShared.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoginController());
  Get.put(RegisterController());
  runApp(const MyApp());
}
