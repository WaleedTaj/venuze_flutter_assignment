import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/theme/app_text_styles.dart';

class RecaptchaBox extends StatelessWidget {
  const RecaptchaBox({super.key, required this.checked, required this.onTap});

  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      checked: checked,
      label: "I'm not a robot",
      child: Material(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          side: const BorderSide(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: AppDimens.fieldHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  _Checkbox(checked: checked),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "I'm not a robot",
                      style: AppTextStyles.captcha,
                    ),
                  ),
                  Image.asset(AppImages.recaptcha, width: 30, height: 29),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: checked ? AppColors.checkboxGreen : AppColors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: checked ? AppColors.checkboxGreen : AppColors.border,
          width: 1.2,
        ),
      ),
      child: checked
          ? const Icon(Icons.check, size: 11, color: AppColors.white)
          : null,
    );
  }
}
