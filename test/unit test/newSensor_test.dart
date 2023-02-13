import 'package:farmadvisor/screens/FirstTimeUser/newFarm.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newSensor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () {});

  test('serial number returns error', () {
    var result = SerialNumberValidator.validate('');
    expect(result, 'serial number can not be empty');
  });

  // test('sensor location returns error', () {
  //   var result = SensorLocationValidator.validate('');
  //   expect(result, 'location can not be empty');
  // });

  test('default GGD returns error', () {
    var result = DefaultGGDValidator.validate('');
    expect(result, 'default GGD can not be empty');
  });

  test('sensor installation date returns error', () {
    var result = SensorInstallationDateVlidator.validate('');
    expect(result, 'sensor installation date can not be empty');
  });

  test('last cutting date returns error', () {
    var result = LastCuttingDateValidator.validate('');
    expect(result, 'last cutting date can not be empty');
  });
}
