import 'package:farmadvisor/screens/FirstTimeUser/new_farm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmadvisor/screens/FirstTimeUser/new_field.dart';

void main() {
  test('', () {});

  test('field name returns error', () {
    var result = NameValidator.validate('');
    expect(result, 'field name can not be empty');
  });

  // test('altitude returns error', () {
  //   var result = LocationValidator.validate('');
  //   expect(result, 'altitude can not be empty');
  // });
}
