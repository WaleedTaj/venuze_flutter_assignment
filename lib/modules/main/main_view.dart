import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bookings/bookings_view.dart';
import '../placeholder/placeholder_view.dart';
import '../profile/profile_view.dart';
import 'main_view_model.dart';
import 'widgets/main_bottom_nav.dart';
import 'widgets/main_header.dart';

class MainView extends GetView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => MainHeader(
              unreadCount: controller.unreadNotifications.value,
              onNotificationsTap: controller.onNotificationsTap,
            ),
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.currentTab.value.index,
                children: const [
                  PlaceholderView(title: 'Home', icon: Icons.grid_view_rounded),
                  PlaceholderView(
                    title: 'Explore',
                    icon: Icons.format_list_bulleted_rounded,
                  ),
                  BookingsView(),
                  ProfileView(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => MainBottomNav(
          current: controller.currentTab.value,
          onSelect: controller.selectTab,
        ),
      ),
    );
  }
}
