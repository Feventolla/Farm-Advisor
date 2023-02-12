import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newSensor.dart';
import 'package:farmadvisor/main.dart' as app;

void main() {
  group('add new sensor', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('description', (widgetTester) async {
      app.main();
      widgetTester.pumpAndSettle();

      final serialNumber = find.byKey(Key('serial number'));
      final sensorLocation = find.byKey(Key('sensor location'));
      final defaultGGD = find.byKey(Key('default GGD'));
      final sensorInstallationDate =
          find.byKey(Key('sensor initialization date')).first;
      final lastCuttingDate = find.byKey(Key('last cutting date'));
      final addSensorButton = find.byType(ElevatedButton).first;

      widgetTester.enterText(serialNumber, '687978876');
      widgetTester.enterText(sensorLocation, 'hhsjf');
      widgetTester.enterText(defaultGGD, '317');
      widgetTester.enterText(sensorInstallationDate, '12/12/1234');
      widgetTester.enterText(lastCuttingDate, '12/12/1234');
      widgetTester.pumpAndSettle();
      widgetTester.tap(addSensorButton);
      widgetTester.pumpAndSettle();
    });
  });
}
