import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../core/services/session_service.dart';
import '../../data/models/user_model.dart';

class ProfileViewModel extends GetxController {
  ProfileViewModel({required this._session});

  final SessionService _session;

  bool get isLoggedIn => _session.isLoggedIn;
  UserModel? get user => _session.user;

  void onSignIn() => Get.toNamed(AppRoutes.login);

  Future<void> logout() => _session.logout();
}
