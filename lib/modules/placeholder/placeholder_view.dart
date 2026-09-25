import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Stand-in for tabs that are not part of the provided designs.
class PlaceholderView extends StatelessWidget {
  const PlaceholderView({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: AppColors.navInactive),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.title),
          const SizedBox(height: 2),
          Text('Coming soon', style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
