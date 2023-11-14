import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class ProgressHUD {
  static void show({String? message}) {
    if (!EasyLoading.isShow) {
      EasyLoading.show(status: message ?? 'Đang xử lý...', dismissOnTap: false);
    }
  }

  static void dismiss() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.foldingCube
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = AppColor.primary.withOpacity(0.6)
    ..boxShadow = []
    ..indicatorColor = AppColor.white
    ..textColor = AppColor.white
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = true
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
