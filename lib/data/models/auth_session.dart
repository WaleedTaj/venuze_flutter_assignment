import 'auth_tokens.dart';
import 'user_model.dart';

/// The `data` payload returned by `POST api/auth/login`.
class AuthSession {
  const AuthSession({required this.tokens, required this.user});

  final AuthTokens tokens;
  final UserModel user;

  factory AuthSession.fromJson(Map<String, dynamic> json) => AuthSession(
    tokens: AuthTokens.fromJson(
      Map<String, dynamic>.from(json['tokens'] as Map? ?? {}),
    ),
    user: UserModel.fromJson(
      Map<String, dynamic>.from(json['user'] as Map? ?? {}),
    ),
  );

  Map<String, dynamic> toJson() => {
    'tokens': tokens.toJson(),
    'user': user.toJson(),
  };
}
