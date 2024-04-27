import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/otp/views/otp_view.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/models/req/register_req.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  // final TextEditingController numberController = TextEditingController();
  // String initialCountry = 'IN';
  // PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
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

  void validation(BuildContext context, error) {
    AchievementView(
      title: "Error!",
      subTitle: error,
      isCircle: isCircle,
      listener: print,
      icon: Icon(Icons.mood_bad, color: const Color.fromARGB(255, 180, 86, 86)),
      iconBackgroundColor: Colors.white,
      color: Colors.red,
      borderRadius: BorderRadius.circular(12),
    ).show(context);
  }

  onRegisterClick(context) async {
    final bool isValid = EmailValidator.validate(registerEmailController.text);
    if (!isValid ||
        registerEmailController.text.isEmpty ||
        registerNameController.text.isEmpty) {
      final error =
          "Please fill in all required fields, or provide valid entries.";
      validation(context, error);
    } else {
      final AuthRepo repo = AuthRepo();

      final response = await repo.register(RegisterReq(
        email: registerEmailController.text,
        name: registerNameController.text,
      ));
      if (response != null && response.error == null) {
        Get.to(OtpView(), arguments: registerEmailController.text);
      } else {
        final error = response?.error ?? "Something went wrong";
        validation(context, error);
      }
    }
  }
}
