import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../core/services/session_service.dart';
import '../../data/models/user_model.dart';

class BookingsViewModel extends GetxController {
  BookingsViewModel({required this._session});

  final SessionService _session;

  bool get isLoggedIn => _session.isLoggedIn;
  UserModel? get user => _session.user;

  void onSignIn() => Get.toNamed(AppRoutes.login);
}
