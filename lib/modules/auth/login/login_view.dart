import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/responsive_content.dart';
import 'login_view_model.dart';
import 'widgets/or_divider.dart';
import 'widgets/recaptcha_box.dart';
import 'widgets/social_login_button.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppDimens.pagePadding,
              20,
              AppDimens.pagePadding,
              32,
            ),
            child: ResponsiveContent(
              child: AutofillGroup(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: AppLogo(),
                      ),
                      const SizedBox(height: 22),
                      Text('Log in', style: AppTextStyles.heading),
                      const SizedBox(height: 2),
                      _SignUpPrompt(onSignUp: controller.onSignUp),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: controller.emailController,
                        focusNode: controller.emailFocus,
                        hint: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        validator: Validators.email,
                        onFieldSubmitted: (_) =>
                            controller.passwordFocus.requestFocus(),
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        controller: controller.passwordController,
                        focusNode: controller.passwordFocus,
                        hint: 'Password',
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        validator: Validators.password,
                        onFieldSubmitted: (_) => controller.login(),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: controller.onForgotPassword,
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.linkSmall,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      Obx(
                        () => RecaptchaBox(
                          checked: controller.isRobotChecked.value,
                          onTap: controller.toggleRobotCheck,
                        ),
                      ),
                      Obx(() {
                        final error = controller.errorMessage.value;
                        return AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: error == null
                              ? const SizedBox(
                                  width: double.infinity,
                                  height: 28,
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    error,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.error,
                                    ),
                                  ),
                                ),
                        );
                      }),
                      Obx(
                        () => PrimaryButton(
                          label: 'Login',
                          isLoading: controller.isLoading.value,
                          onPressed: controller.login,
                        ),
                      ),
                      const SizedBox(height: 44),
                      const OrDivider(text: 'or continue with'),
                      const SizedBox(height: 22),
                      SocialLoginButton(
                        icon: AppImages.facebook,
                        label: 'Log in with Facebook',
                        onTap: () => controller.onSocialLogin('Facebook'),
                      ),
                      const SizedBox(height: 11),
                      SocialLoginButton(
                        icon: AppImages.google,
                        label: 'Log in with Google',
                        onTap: () => controller.onSocialLogin('Google'),
                      ),
                      const SizedBox(height: 11),
                      SocialLoginButton(
                        icon: AppImages.apple,
                        label: 'Log in with Apple',
                        onTap: () => controller.onSocialLogin('Apple'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpPrompt extends StatelessWidget {
  const _SignUpPrompt({required this.onSignUp});

  final VoidCallback onSignUp;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.body,
        children: [
          const TextSpan(text: 'Don’t have account Yet? '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: onSignUp,
              child: Text('Sign up', style: AppTextStyles.link),
            ),
          ),
        ],
      ),
    );
  }
}
