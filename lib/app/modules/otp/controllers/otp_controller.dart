import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/signin/views/signin_view.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/models/req/register_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/register_verify_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  String? otp;
  bool isCircle = false;

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

  onOtpClick(BuildContext context) async {
    if (otp != null) {
      final AuthRepo repo = AuthRepo();

      final response = await repo.registerVerify(
        RegisterVerifyReq(
          otp: otp!,
          email: Get.arguments,
        ),
      );
      if (response != null && response.error == null) {
        validation(
          context,
          'Registration Successful',
          Colors.green,
          "Success!",
          Icons.emoji_emotions,
          Colors.green,
        );
        Get.offAll(SigninView());
      } else {
        validation(
          context,
          response?.error ?? 'Something went wrong',
          Colors.red,
          "Error!",
          Icons.mood_bad,
          Colors.red,
        );
      }
    } else {
      validation(
        context,
        'Please enter OTP',
        Colors.red,
        "Error!",
        Icons.mood_bad,
        Colors.red,
      );
    }
  }

  onOtpResendClick(BuildContext context) async {
    final AuthRepo repo = AuthRepo();

    final response =
        await repo.registerResend(RegisterResendReq(email: Get.arguments));

    if (response != null && response.error == null) {
      validation(
        context,
        'OTP Resend Successful',
        Colors.green,
        "Success!",
        Icons.emoji_emotions,
        Colors.green,
      );
    } else {
      validation(
        context,
        response?.error ?? 'Something went wrong',
        Colors.red,
        "Error!",
        Icons.mood_bad,
        Colors.red,
      );
    }
  }
}
