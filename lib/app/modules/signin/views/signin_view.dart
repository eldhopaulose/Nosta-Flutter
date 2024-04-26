import 'package:e_commerse/app/modules/home/views/home_view.dart';
import 'package:e_commerse/app/modules/register/views/register_view.dart';
import 'package:e_commerse/app/modules/widgets/button.dart';
import 'package:e_commerse/app/modules/widgets/edit_text.dart';
import 'package:e_commerse/app/modules/widgets/heading_text.dart';
import 'package:e_commerse/app/modules/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SigninController());
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
                    height: 400,
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(HomeView());
                      },
                      child: Text("Skip",
                          style: TextStyle(color: Colors.green, fontSize: 25)),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 320,
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
                          const HeadingText(text: 'Sign In', marginTop: 45),
                          // MobileNumberInput(
                          //   number: controller.number,
                          //   numberController: controller.numberController,
                          // ),

                          EditText(
                            text: 'Enter Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.emailController,
                          ),
                          Button(
                            text: 'Get OTP',
                            onClick: () {
                              controller.onSignInClick(context);
                            },
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextView(
                                text: 'Don\'t have an account ',
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const RegisterView());
                                },
                                child: const TextView(
                                  text: ' Register Now',
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
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
