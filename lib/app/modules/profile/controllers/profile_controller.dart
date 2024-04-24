import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/networks/dio/repo/address_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/models/req/address_req.dart';
import 'package:e_commerse/app/networks/models/res/address_res.dart';
import 'package:e_commerse/app/networks/models/res/get_address_res.dart';
import 'package:e_commerse/app/networks/models/res/get_user_data_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isCircle = false;

  RxString name = ''.obs;

  RxString address = ''.obs;

  RxString pincode = ''.obs;

  RxString mobileNumber = ''.obs;

  RxString district = ''.obs;

  RxString state = ''.obs;

  RxString id = ''.obs;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  final TextEditingController mobileNumberController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController stateController = TextEditingController();

  final StreamController<GetAddressRes?> _fetchAdress =
      StreamController<GetAddressRes?>.broadcast();

  Stream<GetAddressRes?> get fetchAdress => _fetchAdress.stream;

  @override
  void onInit() {
    getAdress();
    nameController.text = name.value;
    addressController.text = address.value;
    pincodeController.text = pincode.value;
    mobileNumberController.text = mobileNumber.value;
    districtController.text = district.value;
    stateController.text = state.value;
    super.onInit();
  }

  @override
  void onReady() {
    nameController.text = name.value;
    addressController.text = address.value;
    pincodeController.text = pincode.value;
    mobileNumberController.text = mobileNumber.value;
    districtController.text = district.value;
    stateController.text = state.value;
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    mobileNumberController.dispose();
    districtController.dispose();
    stateController.dispose();

    super.onClose();
  }

  void error(BuildContext context, error, Color color, String title,
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

  Future<GetUserDataRes?> getUserData(context) async {
    AuthRepo repo = AuthRepo();
    final response = await repo.getUserData();
    if (response!.user != null && response.error == null) {
      return response;
    } else {
      final response = await repo.getUserData();
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
      return null;
    }
  }

  onCreateAddress(context) async {
    final AddressRepo repo = AddressRepo();

    final response = await repo.createAddress(AddressReq(
      name: nameController.text,
      address: addressController.text,
      pincode: pincodeController.text,
      mobileNumber: mobileNumberController.text,
      district: districtController.text,
      state: stateController.text,
    ));

    if (response!.error == null) {
      error(context, response.error, Colors.green, "Success", Icons.check,
          Colors.green);
    } else {
      error(context, response.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  Future getAdress() async {
    final AddressRepo repo = AddressRepo();
    final response = await repo.getAllAddress();

    _fetchAdress.add(response!);
    update();
  }

  onUpdateAddress(context) async {
    final AddressRepo repo = AddressRepo();

    final response = await repo.updateAddress(
      AddressReq(
        name: nameController.text,
        address: addressController.text,
        pincode: pincodeController.text,
        mobileNumber: mobileNumberController.text,
        district: districtController.text,
        state: stateController.text,
      ),
      id.value,
    );

    if (response!.error == null) {
      error(context, response.error, Colors.green, "Success", Icons.check,
          Colors.green);
    } else {
      error(context, response.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }
}
