import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/size_constants.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class MoneyWidget extends StatelessWidget {
  final void Function()? onTap;
  final String value;
  const MoneyWidget({
    super.key,
    required this.onTap,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              //color: Color(0xFFe8e8e8),
              blurRadius: 2.0,
              offset: Offset(0, 0.5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.5, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ví của bạn',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: heightDivider,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_money_outlined,
                    color: AppColor.primary,
                    size: sizeIconNapTien,
                  ),
                  const SizedBox(
                    height: heightSizeBox,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: widthContainerNapTien,
                      height: heightContainerNapTien,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Nạp tiền',
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
