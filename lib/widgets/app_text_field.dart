import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_dimens.dart';
import '../core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.suffix,
    this.autofillHints,
  });

  final TextEditingController controller;
  final String hint;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffix;
  final Iterable<String>? autofillHints;

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.hint,
        isDense: true,
        constraints: const BoxConstraints(minHeight: AppDimens.fieldHeight),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 11.5,
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 40,
          minWidth: 44,
        ),
        errorStyle: AppTextStyles.linkSmall.copyWith(
          color: AppColors.error,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.borderFocused),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error),
      ),
    );
  }
}
