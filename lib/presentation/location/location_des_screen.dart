import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/location.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/location/component/location_item_widget.dart';

class LocationDesScreen extends StatelessWidget {
  LocationDesScreen({Key? key}) : super(key: key);
  final DatabaseReference db =
      FirebaseDatabase.instance.ref().child('locations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text('Điểm đến'),
      ),
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: db,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String name = snapshot.child('name').value.toString();
          String address = snapshot.child('address').value.toString();
          final location = Location(id: id, name: name, address: address);
          return LocationItemWidget(
            location: location,
            onTap: () {
              HomePageController.instance.selectDesLocation(
                location.name,
                location.id,
              );
            },
          );
        },
      ),
    );
  }
}
