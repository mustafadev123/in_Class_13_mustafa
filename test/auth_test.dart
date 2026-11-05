import 'package:flutter_test/flutter_test.dart';

import 'package:in_class_13_mustafa/services/input_validators.dart';

void main() {
  test('email validation rejects blank and malformed input', () {
    expect(validateEmail(''), 'Enter your email address.');
    expect(validateEmail('student.example.com'), 'Enter a valid email address.');
    expect(validateEmail('student@example.com'), isNull);
  });

  test('password validation enforces the Firebase minimum length', () {
    expect(validatePassword(''), 'Enter your password.');
    expect(validatePassword('12345'), 'Use at least six characters.');
    expect(validatePassword('123456'), isNull);
  });
}
