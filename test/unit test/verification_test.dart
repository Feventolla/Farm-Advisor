import 'package:farmadvisor/screens/Onboarding/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () {});

  test('empty verification number returns error', () {
    var result = VerificationValidator.validate('');
    expect(result, 'verification number can not be empty');
  });
}
