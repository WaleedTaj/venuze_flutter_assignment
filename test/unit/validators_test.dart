import 'package:flutter_test/flutter_test.dart';
import 'package:venuze_flutter_assignment/core/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('rejects empty and malformed input', () {
      expect(Validators.email(''), isNotNull);
      expect(Validators.email('   '), isNotNull);
      expect(Validators.email('foo@'), isNotNull);
      expect(Validators.email('foo.bar.com'), isNotNull);
    });

    test('accepts valid addresses including plus aliases', () {
      expect(Validators.email('fiju705+premier@gmail.com'), isNull);
      expect(Validators.email(' a.b@c.co.uk '), isNull);
    });
  });

  test('Validators.password requires a value', () {
    expect(Validators.password(''), isNotNull);
    expect(Validators.password('12345678'), isNull);
  });
}
