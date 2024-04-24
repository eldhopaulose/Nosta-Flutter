import 'package:e_commerse/app/modules/cart/views/cart_view.dart';
import 'package:e_commerse/app/modules/favorite/views/favorite_view.dart';
import 'package:e_commerse/app/modules/home/views/home_view.dart';
import 'package:e_commerse/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

List<Widget> buildScreens() {
  return [
    const HomeView(),
    const FavoriteView(),
    const CartView(),
    const ProfileView()
  ];
}
