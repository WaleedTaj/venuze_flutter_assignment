import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/primary_button.dart';
import 'profile_view_model.dart';

/// Minimal profile tab (not in the designs) so the signed-in state and logout are reachable.
class ProfileView extends GetView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          final user = controller.user;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Color(0xFFF1F1F1),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.navInactive,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                user?.displayName ?? 'Guest',
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
              if (user != null) ...[
                Text(
                  user.email,
                  style: AppTextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
                if (user.businessName != null)
                  Text(
                    user.businessName!,
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
              ],
              const SizedBox(height: 20),
              PrimaryButton(
                label: user == null ? 'Sign in' : 'Log out',
                width: 120,
                height: 44,
                textStyle: AppTextStyles.buttonSmall,
                onPressed: user == null
                    ? controller.onSignIn
                    : controller.logout,
              ),
            ],
          );
        }),
      ),
    );
  }
}
