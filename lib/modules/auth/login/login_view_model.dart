import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/services/session_service.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginViewModel extends GetxController {
  LoginViewModel({required this._repository, required this._session});

  final AuthRepository _repository;
  final SessionService _session;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final isLoading = false.obs;
  final isRobotChecked = false.obs;
  final errorMessage = RxnString();

  void toggleRobotCheck() {
    isRobotChecked.toggle();
    if (isRobotChecked.value) errorMessage.value = null;
  }

  Future<void> login() async {
    if (isLoading.value) return;
    errorMessage.value = null;
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(formKey.currentState?.validate() ?? false)) return;
    if (!isRobotChecked.value) {
      errorMessage.value = "Please confirm you're not a robot";
      return;
    }

    isLoading.value = true;
    try {
      final session = await _repository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      await _session.save(session);
      Get.back(result: true);
      Get.snackbar(
        'Welcome back',
        'Logged in as ${session.user.displayName}',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    } on ApiException catch (e) {
      errorMessage.value = e.message;
    } catch (_) {
      errorMessage.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void onSocialLogin(String provider) => _comingSoon('Log in with $provider');

  void onForgotPassword() => _comingSoon('Forgot password');

  void onSignUp() => _comingSoon('Sign up');

  void _comingSoon(String feature) {
    Get.snackbar(
      feature,
      'This feature is coming soon.',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
