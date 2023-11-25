import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/top_up.dart';
import 'package:tdc_coach_user/presentation/top_up/controller/top_up_controller.dart';

class AccountTopUpItem extends StatelessWidget {
  final TopUp topUp;
  final void Function()? onTap;
  const AccountTopUpItem({
    super.key,
    required this.onTap,
    required this.topUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Mã nạp tiền: ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  topUp.id,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Ngày nạp: ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  topUp.creatAt,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Số tiền nạp: ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${TopUpController.instance.formatCurrency(topUp.money.toString())} đ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Trạng thái: ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  topUp.status == 0 ? 'Đang nạp...' : 'Thành công',
                  style: TextStyle(
                    fontSize: 15,
                    color: topUp.status == 0 ? AppColor.primary : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
