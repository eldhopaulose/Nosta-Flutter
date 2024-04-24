import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:e_commerse/app/networks/dio/repo/like_repo.dart';
import 'package:e_commerse/app/networks/models/res/get_all_liked_byid_res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_likes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  bool isCircle = false;

  final StreamController<GetAllLikesRes?> _fetchAllLiked =
      StreamController<GetAllLikesRes?>.broadcast();

  Stream<GetAllLikesRes?> get fetchCustomerProductLikede =>
      _fetchAllLiked.stream;

  final StreamController<GetAllLikesByIdRes?> _fetchAllLikedByID =
      StreamController<GetAllLikesByIdRes?>.broadcast();

  Stream<GetAllLikesByIdRes?> get fetchCustomerProductLikedeById =>
      _fetchAllLikedByID.stream;

  @override
  void onInit() async {
    await getAllLiked().then((_) async {
      await Future.delayed(
          Duration(seconds: 5)); // Introducing a 2-second delay
      getAllLikedbyId();
      print("all liked");
    });
    super.onInit();
  }

  @override
  void onReady() async {
    await getAllLiked().then((_) async {
      await Future.delayed(
          Duration(seconds: 2)); // Introducing a 2-second delay
      getAllLikedbyId();
      print("all liked");
    });
    super.onReady();
  }

  @override
  void onClose() {
    _fetchAllLiked.close();
    _fetchAllLikedByID.close();
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

  Future getAllLiked() async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.getAllLikesData();

    _fetchAllLiked.sink.add(response!);
  }

  Future getAllLikedbyId() async {
    final LikeRepo repo = LikeRepo();
    final response = await repo.getAllLikes();

    _fetchAllLikedByID.sink.add(response!);
  }
}
