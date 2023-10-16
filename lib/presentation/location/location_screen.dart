import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/location.dart';
import 'package:tdc_coach_user/presentation/list_trip.dart/trips_data.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text('Điểm đi'),
      ),
      body: ListView.builder(
        itemCount: locationsData.length,
        itemBuilder: (context, index) {
          Location location = locationsData[index];
          return Column(
            children: [
              ListTile(
                title: Text(location.name),
                onTap: () {
                  // Truyền dữ liệu location.name khi người dùng chọn địa điểm
                  Navigator.pop(context, location.name);
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
