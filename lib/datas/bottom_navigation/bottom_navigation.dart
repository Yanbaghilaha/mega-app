import 'package:e_commerce/models/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

List<BottomNavigation> bottomNavigation = [
  BottomNavigation(icon: const Icon(IconlyLight.home), text: "HOME"),
  BottomNavigation(icon: const Icon(IconlyLight.heart), text: "WISHLIST"),
  BottomNavigation(icon: const Icon(IconlyLight.bag), text: "ORDER"),
  BottomNavigation(icon: const Icon(IconlyLight.profile), text: "LOGIN"),
];
