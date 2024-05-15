import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:e_commerse/app/networks/dio/repo/auth_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/like_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/offer_repo.dart';
import 'package:e_commerse/app/networks/dio/repo/product_repo.dart';
import 'package:e_commerse/app/networks/models/res/get_all_liked_byid_res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_likes.dart';
import 'package:e_commerse/app/networks/models/res/get_product_res.dart';
import 'package:e_commerse/app/networks/models/res/get_user_data_res.dart';
import 'package:e_commerse/app/networks/models/res/offer_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final selectedCategory = ''.obs;

  get isCircle => circle;

  bool circle = false;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final StreamController<GetProductRes?> _getProducts =
      StreamController<GetProductRes?>.broadcast();

  Stream<GetProductRes?> get getAllProducts => _getProducts.stream;

  final StreamController<GetAllLikesByIdRes?> _fetchAllLiked =
      StreamController<GetAllLikesByIdRes?>.broadcast();

  Stream<GetAllLikesByIdRes?> get fetchCustomerProductLikede =>
      _fetchAllLiked.stream;

  @override
  void onInit() {
    getProducts("All", Get.context!).then((_) {
      // Call getAllLiked after getProducts completes successfully
      getAllLiked();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _fetchAllLiked.close();
    _getProducts.close();
    _fetchAllLiked.close();
    _getProducts.close();
    favoriteController.getAllLiked();
    print("close");
    super.onClose();
  }

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
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

  Future getProducts(String categories, context) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.getProduct(categories);
    if (response?.products != null && response?.error == null) {
      _getProducts.sink.add(response);
    } else {
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  onlikeProduct(String productId, context) async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.like(productId);
    getProducts("All", Get.context!).then((_) {
      // Call getAllLiked after getProducts completes successfully
      getAllLiked();
    });
    favoriteController.getAllLiked().then((_) {
      favoriteController.getAllLikedbyId();
    });
    if (response?.error != null) {
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  onunlikeProduct(String productId, context) async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.unlike(productId);
    getProducts("All", Get.context!).then((_) {
      // Call getAllLiked after getProducts completes successfully
      getAllLiked();
    });
    favoriteController.getAllLiked().then((_) {
      favoriteController.getAllLikedbyId();
    });
    if (response?.error != null) {
      error(context, response!.error, Colors.red, "Error", Icons.error,
          Colors.red);
    }
  }

  Future getAllLiked() async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.getAllLikes();

    _fetchAllLiked.sink.add(response!);
  }

  Future<bool> hasToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString("token");
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<OfferRes?> getOffers() async {
    final OfferRepo repo = OfferRepo();
    final response = await repo.getOffer();
    if (response?.offers != null && response?.error == null) {
      return response;
    }
  }
}
