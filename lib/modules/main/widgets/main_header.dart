import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/app_logo.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
    required this.unreadCount,
    required this.onNotificationsTap,
  });

  final int unreadCount;
  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 25),
            child: Row(
              children: [
                const AppLogo(width: 40),
                const Spacer(),
                _NotificationButton(
                  count: unreadCount,
                  onTap: onNotificationsTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Notifications, $count unread',
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Material(
                color: AppColors.primary,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onTap,
                  child: SizedBox.square(
                    dimension: 44,
                    child: Center(
                      child: Image.asset(
                        AppImages.notification,
                        width: 19,
                        height: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (count > 0)
              Positioned(
                right: -6,
                top: 6,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 20),
                  // height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.white, width: 3),
                  ),
                  child: Text(
                    count > 99 ? '99+' : '$count',
                    style: AppTextStyles.badge.copyWith(height: 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
