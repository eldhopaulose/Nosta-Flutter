import 'package:get/get.dart';

import '../controllers/otp_signin_controller.dart';

class OtpSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpSigninController>(
      () => OtpSigninController(),
    );
  }
}
