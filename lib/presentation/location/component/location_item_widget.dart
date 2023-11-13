import 'package:flutter/material.dart';
import 'package:tdc_coach_user/domain/model/location.dart';

class LocationItemWidget extends StatelessWidget {
  final Location location;
  final void Function()? onTap;

  const LocationItemWidget({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ListTile(
            title: Text(location.name),
            subtitle: Text(location.address),
            onTap: onTap,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
