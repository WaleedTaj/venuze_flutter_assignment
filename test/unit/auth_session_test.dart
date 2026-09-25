import 'package:flutter_test/flutter_test.dart';
import 'package:venuze_flutter_assignment/data/models/auth_session.dart';

void main() {
  final json = {
    'tokens': {
      'access_token': 'access',
      'refresh_token': 'refresh',
      'token_type': 'bearer',
      'access_token_expires_at': '2026-10-25T06:22:08.239981Z',
      'refresh_token_expires_at': '2026-12-23T20:22:08.239981Z',
    },
    'user': {
      'id': '0644',
      'email': 'fiju705+premier@gmail.com',
      'name': 'Hafeez',
      'first_name': null,
      'last_name': null,
      'phone': '+97123423424',
      'role': 'venue_owner',
      'profile': {'business_name': "Pasadena's Premier"},
    },
  };

  test('parses the login payload', () {
    final session = AuthSession.fromJson(json);
    expect(session.tokens.accessToken, 'access');
    expect(session.tokens.refreshTokenExpiresAt, DateTime.utc(2026, 12, 23, 20, 22, 8, 239, 981));
    expect(session.user.displayName, 'Hafeez');
    expect(session.user.businessName, "Pasadena's Premier");
  });

  test('round-trips through toJson for persistence', () {
    final restored = AuthSession.fromJson(AuthSession.fromJson(json).toJson());
    expect(restored.user.email, 'fiju705+premier@gmail.com');
    expect(restored.user.businessName, "Pasadena's Premier");
    expect(restored.tokens.refreshToken, 'refresh');
  });
}
