import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newFarm.dart';

void main() {

  test('empty farm name returns error', () {
    var result = FarmNameValidator.validate('');
    expect(result, 'farm name can not be empty');
  });

  test('empty location returns error', () {
    var result = LocationValidator.validate('');
    expect(result, 'location can not be empty');
  });
}
