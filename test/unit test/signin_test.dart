// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmadvisor/screens/Onboarding/signin.dart';

void main() {
  test('', () {});

  test('empty phone number returns error', () {
    var result = PhoneValidator.validate('');
    expect(result, 'phone number can not be empty');
  });
}
