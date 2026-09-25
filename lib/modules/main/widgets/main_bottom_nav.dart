import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_text_styles.dart';
import '../main_view_model.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    super.key,
    required this.current,
    required this.onSelect,
  });

  final MainTab current;
  final ValueChanged<MainTab> onSelect;

  static const _items = [
    (tab: MainTab.home, label: 'Home', icon: AppImages.navHome),
    (tab: MainTab.explore, label: 'Explore', icon: AppImages.navExplore),
    (tab: MainTab.bookings, label: 'Bookings', icon: AppImages.navBookings),
    (tab: MainTab.profile, label: 'Profile', icon: AppImages.navProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 40,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (final item in _items)
                Expanded(
                  child: _NavItem(
                    label: item.label,
                    icon: item.icon,
                    selected: item.tab == current,
                    onTap: () => onSelect(item.tab),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Assets ship in mixed colours, so always tint to keep the nav state-driven.
    final tint = selected ? AppColors.primary : AppColors.navInactive;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      child: InkResponse(
        onTap: onTap,
        radius: 36,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24, height: 24, color: tint),
            const SizedBox(height: 4),
            Text(
              label,
              style: selected
                  ? AppTextStyles.navLabelActive
                  : AppTextStyles.navLabel,
            ),
          ],
        ),
      ),
    );
  }
}
