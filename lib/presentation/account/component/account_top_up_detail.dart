import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/domain/model/top_up.dart';
import 'package:tdc_coach_user/presentation/top_up/controller/top_up_controller.dart';

class PaymentItem extends StatelessWidget {
  final TopUp topUp;
  final void Function()? onTapSucces;
  final void Function()? onTapCancel;
  const PaymentItem({
    super.key,
    required this.topUp,
    this.onTapSucces,
    this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Mã nạp: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                topUp.id,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Ngày tạo: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                topUp.creatAt,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Số tiền nạp: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '${TopUpController.instance.formatCurrency(topUp.money.toString())} đ',
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Phương thức: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                topUp.paymentMethod,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              const Text(
                'Lời nhắn: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                topUp.payContent,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Trạng thái: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                topUp.status == 0 ? 'Đang nạp...' : 'Thành công',
                style: TextStyle(
                  color: topUp.status == 0 ? AppColor.primary : Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
