import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/bottom_nav/views/bottom_nav_view.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/models/req/signin_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_verify_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpSigninController extends GetxController {
  bool isCircle = true;
  String? otp;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void validation(BuildContext context, error, Color color, String title,
      IconData icon, Color iconColor) {
    AchievementView(
      title: title,
      subTitle: error,
      isCircle: isCircle,
      listener: print,
      icon: Icon(icon, color: iconColor),
      iconBackgroundColor: Colors.white,
      color: color,
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  onClickOtp(context) async {
    print(otp);
    if (otp != null) {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final AuthRepo repo = AuthRepo();
      final response = await repo
          .signinVerify(SigninVerifyReq(email: Get.arguments, otp: otp));

      if (response!.token != null && response.error == null) {
        sp.setString("token", response.token.toString());
        Get.offAll(BottomNavView());
      } else {
        validation(context, response.error, Colors.red, "Error", Icons.mood_bad,
            Colors.red);
      }
    }
  }

  onClickResend(context) async {
    final AuthRepo repo = AuthRepo();
    final response =
        await repo.signinResend(SigninResendReq(email: Get.arguments));

    if (response!.message != null && response.error == null) {
      validation(context, response.message, Colors.green, "Success", Icons.mood,
          Colors.green);
    } else {
      validation(context, response.error, Colors.red, "Error", Icons.mood_bad,
          Colors.red);
    }
  }
}
