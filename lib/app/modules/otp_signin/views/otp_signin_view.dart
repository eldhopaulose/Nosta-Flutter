import 'package:e_commerse/app/modules/widgets/button.dart';
import 'package:e_commerse/app/modules/widgets/otp.dart';
import 'package:e_commerse/app/modules/widgets/text_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_signin_controller.dart';

class OtpSigninView extends GetView<OtpSigninController> {
  const OtpSigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OtpSigninController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpSigninView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            OtpWidget(otpGet: (String otp) {
              controller.otp = otp;
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextView(
                  text: 'Resend OTP? ',
                  fontSize: 13,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    controller.onClickResend(context);
                  },
                  child: const TextView(
                    text: 'Get OTP',
                    fontSize: 13,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Button(
              text: 'Register Now',
              onClick: () {
                controller.onClickOtp(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
