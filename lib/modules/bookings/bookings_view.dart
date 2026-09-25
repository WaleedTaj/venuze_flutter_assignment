import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_images.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/primary_button.dart';
import 'bookings_view_model.dart';

class BookingsView extends GetView<BookingsViewModel> {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Obx(() {
                final loggedIn = controller.isLoggedIn;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Image.asset(
                        AppImages.noBookings,
                        width: 157,
                        height: 157,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'No bookings found',
                      style: AppTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      loggedIn
                          ? 'Hi ${controller.user!.displayName}, you have no bookings yet.'
                          : 'Log in or sign up to begin your journey.',
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    if (!loggedIn) ...[
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Sign in',
                        width: 120,
                        height: 44,
                        textStyle: AppTextStyles.buttonSmall,
                        onPressed: controller.onSignIn,
                      ),
                    ],
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
