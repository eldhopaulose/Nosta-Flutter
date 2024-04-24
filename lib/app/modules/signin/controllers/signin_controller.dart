import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/bottom_nav/views/bottom_nav_view.dart';
import 'package:e_commerse/app/modules/otp_signin/views/otp_signin_view.dart';
import 'package:e_commerse/app/modules/signin/views/signin_view.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/models/req/signin_req.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  // final TextEditingController numberController = TextEditingController();
  // String initialCountry = 'IN';
  // PhoneNumber number = PhoneNumber(isoCode: 'IN');

  final TextEditingController emailController = TextEditingController();

  bool isCircle = true;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
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

  onSignInClick(context) async {
    final bool isValid = EmailValidator.validate(emailController.text);

    if (!isValid || emailController.text.isEmpty) {
      final error =
          "Please fill in all required fields, or provide valid entries.";
      validation(
        context,
        error,
        Colors.red,
        "Error!",
        Icons.mood_bad,
        Colors.red,
      );
    } else {
      final AuthRepo repo = AuthRepo();
      final response =
          await repo.signin(SigninReq(email: emailController.text));
      if (response!.user != null && response.error == null) {
        validation(
          context,
          'OTP Sent Successfully',
          Colors.green,
          "Success!",
          Icons.emoji_emotions,
          Colors.green,
        );
        Get.to(OtpSigninView(), arguments: emailController.text);
      } else {
        final error = response.error!;
        validation(
          context,
          error,
          Colors.red,
          "Error!",
          Icons.mood_bad,
          Colors.red,
        );
      }
    }
  }

  void initialization() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final token = sp.getString("token");
      print("token");
      print(token);
      if (token != null) {
        Get.offAll(BottomNavView());
        FlutterNativeSplash.remove();
      } else {
        print("SigninView");
        FlutterNativeSplash.remove();
      }
    } catch (e) {
      print(e);
    }
  }
}
