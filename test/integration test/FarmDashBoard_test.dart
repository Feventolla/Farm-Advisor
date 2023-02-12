import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart' as app;
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'finders.dart';
// import 'list_content.dart'

void main() {
  group('list of fields', () {
    late FlutterDriver driver;
    // driver = FlutterDriver.connect();

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      // driver = await FlutterDriver.connect();
      if (driver != null) {
        driver.close();
      }
      ;
    });

    test('verify empity list message', () async {
      // driver = await FlutterDriver.connect();
      // SerializableFinder emptyMessage = find.text(EMPTY);

      await driver.waitFor(emptyMessage);
      await driver.waitFor(showFields);
    });
  });
}
