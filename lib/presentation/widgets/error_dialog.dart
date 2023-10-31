import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class ErrorDialogWidget extends StatelessWidget {
  final title;
  const ErrorDialogWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    'Lỗi !!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop;
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 30,
              child: Icon(
                Icons.warning,
                size: 20,
                color: AppColor.white,
              ),
            ),
            top: 5,
          )
        ],
      ),
    );
  }
}
