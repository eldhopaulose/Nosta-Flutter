import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerse/app/networks/dio/repo/cart_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/product_repo.dart';
import 'package:e_commerse/app/networks/models/req/add_cart_req.dart';
import 'package:e_commerse/app/networks/models/res/get_single_product_by_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  bool isCircle = false;
  CartController cartControllerr = Get.put(CartController());

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

  Future<GetSingleProductByIdRes?> getSingleProductById(String id) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.getSingleProduct(id);
    return response;
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

  onCLickCart(String id, context) async {
    final CartRepo repo = CartRepo();
    final reponse = await repo.addCart(id, AddCartReq(quantity: 1));
    if (reponse!.cart != null) {
cartControllerr.getAllCart();
      validation(
        context,
        'Added to cart',
        Colors.green,
        "Success!",
        Icons.emoji_emotions,
        Colors.green,
      );
    } else {
      final error = reponse.error;

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
