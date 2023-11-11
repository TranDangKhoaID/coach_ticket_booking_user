import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  //init
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  //giá trị waller
  var wallet = 0.obs;
  //select điểm đi
  var selectedDeparture = 'Chọn điểm đi'.obs; // Giá trị ban đầu
  var selectedDestination = 'Chọn điểm đến'.obs;
  var isDisable = true.obs;

  // Hàm để chọn địa điểm
  void selectDepartLocation(String location) {
    selectedDeparture.value = location;
    if (selectedDeparture.value.endsWith('Chọn điểm đi') ||
        selectedDestination.value.endsWith('Chọn điểm đến')) {
      isDisable.value = true;
    } else if (selectedDestination.value == location) {
      EasyLoading.showError(
        'Điểm đến và đi không được trùng!',
        dismissOnTap: true,
      );
      selectedDeparture.value = 'Chọn điểm đi';
      return;
    } else {
      isDisable.value = false;
    }
    Get.back();
  }

  void selectDesLocation(String location) {
    selectedDestination.value = location;
    if (selectedDeparture.value.endsWith('Chọn điểm đi') ||
        selectedDestination.value.endsWith('Chọn điểm đến')) {
      isDisable.value = true;
    } else if (selectedDeparture.value == location) {
      EasyLoading.showError(
        'Điểm đến và đi không được trùng!',
        dismissOnTap: true,
      );
      selectedDestination.value = 'Chọn điểm đến';
      return;
    } else {
      isDisable.value = false;
    }
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    getWallet();
  }

  //lấy giá trị wallet từ firebase
  void getWallet() {
    try {
      _database
          .child(FireBaseConstant.customers)
          .child(_auth.currentUser!.uid)
          .child('wallet')
          .onValue
          .listen((event) {
        final snapshot = event.snapshot;
        if (snapshot.value != null) {
          wallet.value = snapshot.value as int;
        }
      });
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
  //
}
