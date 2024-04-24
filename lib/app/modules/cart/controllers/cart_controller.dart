import 'dart:async';
import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/networks/dio/repo/address_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/cart_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/order_repo.dart';
import 'package:e_commerse/app/networks/models/req/add_cart_req.dart';
import 'package:e_commerse/app/networks/models/req/order_placed_req.dart';
import 'package:e_commerse/app/networks/models/req/update_cart_req.dart';
import 'package:e_commerse/app/networks/models/res/get_all_cart_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartController extends GetxController {
  bool isCircle = false;
  RxDouble totalCost = 0.0.obs;

  RxList product = [].obs;
  Razorpay _razorpay = Razorpay();

  final StreamController<GetAllCartRes?> _fetchAllCart =
      StreamController<GetAllCartRes?>.broadcast();

  Stream<GetAllCartRes?> get fetchAllCart => _fetchAllCart.stream;
  @override
  void onInit() {
    getAllCart();
    
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _razorpay.clear();
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

  Future getAllCart() async {
    final CartRepo repo = CartRepo();
    final response = await repo.getAllCart();
    print(response);
    _fetchAllCart.sink.add(response!);
    updateTotalCost(response);
  }

  onCLickIncriment(String id) async {
    final CartRepo repo = CartRepo();
    final response = await repo.addCart(id, AddCartReq(quantity: 1));
    if (response!.error == null) {
      getAllCart();
    }
  }

  onCLickDeecriment(String id) async {
    final CartRepo repo = CartRepo();
    final response =
        await repo.cartQuantityDecriment(id, AddCartReq(quantity: 1));
    if (response!.error == null) {
      getAllCart();
    }
  }

  void updateTotalCost(GetAllCartRes response) {
    double total = 0;
    response.carts?.forEach((cart) {
      cart.items?.forEach((item) {
        total += item.totalCost ?? 0;
      });
    });
    totalCost.value = total;
  }

  onDeleteCart(String id) async {
    final CartRepo repo = CartRepo();
    final response = await repo.deleteCart(id);
    if (response!.error == null) {
      getAllCart();
      update();
    } else {
      error(Get.context!, response.error, Colors.red, "Error", Icons.error,
          Colors.red);
      getAllCart();
    }
  }

  onOrder() async {
    final OrderRepo repo = OrderRepo();

    final AddressRepo repoAddress = AddressRepo();
    final responseAddress = await repoAddress.getAllAddress();

    final CartRepo repoCart = CartRepo();
    final responseCart = await repoCart.getAllCart();

    final response = await repo.orderPlaced(OrderPlacedReq(
        address: responseAddress!.address!.first.sId,
        productId: product,
        totalCost: totalCost.value.toInt()));

    if (response!.error == null) {
      error(Get.context!, response.error, Colors.green, "Success", Icons.check,
          Colors.green);
    } else {
      error(Get.context!, response.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

    // final AuthRepo repo = AuthRepo();
    // final response = await repo.getUserData();

  buyNow() async {
   final AuthRepo repo = AuthRepo();
    final response = await repo.getUserData();
print(totalCost.value);

int money = totalCost.value.toInt();

       var options = {
      'key':  'rzp_test_L6O15RueQQYPaH', // Replace with your actual Razorpay key
      'amount': money* 100, // Amount in paise (e.g., 100 paise = 1 INR)
      'name': 'Nosta',
      'description': 'Cart Payment',
      'prefill': {'email': response!.user!.email, 'name': response.user!.name},
      'external': {
        'wallets': ['paytm'],
      }
    };

    _razorpay.open(options);

 
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Successful: ${response.paymentId}");
      Get.snackbar("Success", "Payment Successful");
       onOrder();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Failed: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("External Wallet Selected: ${response.walletName}");
  }
}
