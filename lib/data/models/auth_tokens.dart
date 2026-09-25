class AuthTokens {
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    this.accessTokenExpiresAt,
    this.refreshTokenExpiresAt,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final DateTime? accessTokenExpiresAt;
  final DateTime? refreshTokenExpiresAt;

  bool get isAccessTokenExpired =>
      accessTokenExpiresAt != null &&
      DateTime.now().isAfter(accessTokenExpiresAt!);

  factory AuthTokens.fromJson(Map<String, dynamic> json) => AuthTokens(
    accessToken: json['access_token'] as String? ?? '',
    refreshToken: json['refresh_token'] as String? ?? '',
    tokenType: json['token_type'] as String? ?? 'bearer',
    accessTokenExpiresAt: DateTime.tryParse(
      json['access_token_expires_at'] as String? ?? '',
    ),
    refreshTokenExpiresAt: DateTime.tryParse(
      json['refresh_token_expires_at'] as String? ?? '',
    ),
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'token_type': tokenType,
    'access_token_expires_at': accessTokenExpiresAt?.toIso8601String(),
    'refresh_token_expires_at': refreshTokenExpiresAt?.toIso8601String(),
  };
}
