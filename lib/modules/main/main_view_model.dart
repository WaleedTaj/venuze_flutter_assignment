import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MainTab { home, explore, bookings, profile }

class MainViewModel extends GetxController {
  final currentTab = MainTab.home.obs;
  final unreadNotifications = 3.obs;

  void selectTab(MainTab tab) => currentTab.value = tab;

  void onNotificationsTap() {
    Get.snackbar(
      'Notifications',
      'You have ${unreadNotifications.value} unread notifications.',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
