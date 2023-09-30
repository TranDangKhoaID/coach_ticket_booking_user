import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/app.dart';
import 'package:tdc_coach_user/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
