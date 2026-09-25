import 'package:get/get.dart';

import '../../data/models/auth_session.dart';
import '../../data/models/user_model.dart';
import 'storage_service.dart';

/// App-wide source of truth for the signed-in user.
class SessionService extends GetxService {
  SessionService(this._storage);

  final StorageService _storage;

  final Rxn<AuthSession> _session = Rxn<AuthSession>();

  AuthSession? get session => _session.value;
  UserModel? get user => _session.value?.user;
  bool get isLoggedIn => _session.value != null;

  SessionService init() {
    final stored = _storage.readSession();
    if (stored != null) {
      final session = AuthSession.fromJson(stored);
      final expiry = session.tokens.refreshTokenExpiresAt;
      if (expiry == null || DateTime.now().isBefore(expiry)) {
        _session.value = session;
      } else {
        _storage.clearSession();
      }
    }
    return this;
  }

  Future<void> save(AuthSession session) async {
    _session.value = session;
    await _storage.writeSession(session.toJson());
  }

  Future<void> logout() async {
    _session.value = null;
    await _storage.clearSession();
  }
}
