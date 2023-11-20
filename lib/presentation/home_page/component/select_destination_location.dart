import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class SelectDestinationLocation extends StatelessWidget {
  final String selectLocation;
  final void Function()? onTap;
  const SelectDestinationLocation({
    super.key,
    required this.selectLocation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Điểm đến',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: onTap,
              child: SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectLocation,
                    style: TextStyle(
                      color: selectLocation.endsWith('Chọn điểm đến')
                          ? Colors.grey
                          : AppColor.primary,
                      fontWeight: selectLocation.endsWith('Chọn điểm đến')
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
