import '../../core/constants/api_endpoints.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_exception.dart';
import '../models/auth_session.dart';

abstract interface class AuthRepository {
  Future<AuthSession> login({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final json = await _client.postForm(ApiEndpoints.login, {
      'email': email,
      'password': password,
    });

    final data = json['data'];
    if (json['success'] != true || data is! Map) {
      throw ApiException(
        json['message'] as String? ?? 'Login failed. Please try again.',
      );
    }
    return AuthSession.fromJson(Map<String, dynamic>.from(data));
  }
}
