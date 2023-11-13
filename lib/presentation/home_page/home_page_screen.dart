import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/presentation/home_page/component/button_search_trip.dart';
import 'package:tdc_coach_user/presentation/home_page/component/icon_positioned.dart';
import 'package:tdc_coach_user/presentation/home_page/component/select_destination_location.dart';
import 'package:tdc_coach_user/presentation/home_page/component/select_departure_location.dart';
import 'package:tdc_coach_user/presentation/home_page/component/money_widget.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/list_trip/list_trip_screen.dart';
import 'package:tdc_coach_user/presentation/location/location_depart_screen.dart';
import 'package:tdc_coach_user/presentation/location/location_des_screen.dart';
import 'package:tdc_coach_user/presentation/top_up/top_up_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text
  String fullName = AppPreferences.instance.getFullName() ?? "Khách Hàng";
  FirebaseAuth auth = FireBaseConstant.auth;
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  //đăng xuất
  void signOut(BuildContext context) {
    AppPreferences.instance.logout();
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    // Chỉ cho phép chế độ màn hình dọc
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Trả lại chế độ màn hình mặc định khi thoát màn hình này (có thể cần)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: appBarTitle(),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => MoneyWidget(
                    onTap: () {
                      Get.to(() => const TopUpScreen());
                    },
                    value: HomePageController.instance.wallet.value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: 0,
                                child: Obx(
                                  () => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SelectDepartureLocation(
                                        selectLocation: HomePageController
                                            .instance.selectedDeparture.value,
                                        onTap: () {
                                          Get.to(() => LocationDepartScreen());
                                        },
                                      ),
                                      SelectDestinationLocation(
                                        selectLocation: HomePageController
                                            .instance.selectedDestination.value,
                                        onTap: () {
                                          Get.to(() => LocationDesScreen());
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const IconPositioned(),
                            ],
                          ),
                        ),
                        selectDateWidget(context),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => ButtonSearchTrip(
                            isDisable:
                                HomePageController.instance.isDisable.value,
                            onTap: () {
                              //filterTrips();
                              Get.to(
                                () => ListTripScreen(
                                  filterDepartureDate: selectedDate,
                                  filterDepartureLocation: HomePageController
                                      .instance.idDeparture.value,
                                  filterDestinationLocation: HomePageController
                                      .instance.idDestination.value,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding selectDateWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  selectedDate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Returning',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = DateFormat('dd/MM/yyyy').format(value);
                        });
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Set date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget appBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.person,
              color: AppColor.primary,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppString.hello,
              style: TextStyle(fontSize: 15),
            ),
            Text(fullName),
          ],
        )
      ],
    );
  }
}
