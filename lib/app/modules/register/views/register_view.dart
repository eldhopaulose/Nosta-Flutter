import 'package:e_commerse/app/modules/signin/views/signin_view.dart';
import 'package:e_commerse/app/modules/widgets/button.dart';
import 'package:e_commerse/app/modules/widgets/edit_text.dart';
import 'package:e_commerse/app/modules/widgets/heading_text.dart';

import 'package:e_commerse/app/modules/widgets/text_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Stack(
                children: [
                  // Add the missing image here
                  Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  ),

                  Positioned(
                    left: 0,
                    top: 220,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          const HeadingText(
                              text: 'Register Now', marginTop: 45),
                          EditText(
                            text: 'Enter Full Name',
                            textInputType: TextInputType.emailAddress,
                            textEditingController:
                                controller.registerNameController,
                          ),
                          // MobileNumberInput(
                          //   number: controller.number,
                          //   numberController: controller.numberController,
                          // ),

                          EditText(
                            text: 'Enter Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController:
                                controller.registerEmailController,
                          ),

                          Button(
                            text: 'Get OTP',
                            onClick: () {
                              controller.onRegisterClick(context);
                            },
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.off(const SigninView());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: 'Already have an account ',
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                TextView(
                                  text: ' Login Now',
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
