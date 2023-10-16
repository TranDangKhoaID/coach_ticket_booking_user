import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class SelectDepartureLocation extends StatelessWidget {
  final String? selectLocation;
  final void Function()? onTap;

  const SelectDepartureLocation({
    super.key,
    required this.selectLocation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
              'Điểm đi',
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
                width: double.infinity,
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectLocation ?? 'Chọn điểm đi',
                    style: TextStyle(
                      color: selectLocation != null
                          ? AppColor.primary
                          : Colors.grey,
                      fontWeight: selectLocation != null
                          ? FontWeight.bold
                          : FontWeight.normal,
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
