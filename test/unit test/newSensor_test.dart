import 'package:farmadvisor/screens/FirstTimeUser/newFarm.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newSensor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () {});

  test('serial number returns error', () {
    var result = SerialValidator.validate('');
    expect(result, 'serial number can not be empty');
  });

  test('sensor location returns error', () {
    var result = CountryValidator.validate('');
    expect(result, 'location can not be empty');
  });

  test('default GGD returns error', () {
    var result = GDDValidator.validate('');
    expect(result, 'default GGD can not be empty');
  });
  test('sensor name returns error', () {
    var result = SensorNameValidator.validate('');
    expect(result, 'sensor name can not be empty');
  });

  test('sensor installation date returns error', () {
    var result = DateValidator.validate('');
    expect(result, 'sensor installation date can not be empty');
  });

  test('last cutting date returns error', () {
    var result = CuttingValidator.validate('');
    expect(result, 'last cutting date can not be empty');
  });
}
