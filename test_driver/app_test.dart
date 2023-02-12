// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter_driver/flutter_driver.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:integration_test/integration_test.dart';
// import 'package:test/test.dart';

// void main() {
//   // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('farm advisor app', () {
//     final signUp = find.byValueKey('sign up');
//     final signIn = find.byValueKey('sign in');
//     final phoneNo = find.byValueKey('phoneNo');
//     final serialNumber = find.byValueKey('serial number');
//     final sensorLocation = find.byValueKey('sensor location');
//     final defaultGGD = find.byValueKey('default GGD');
//     final sensorInstallationDate =
//         find.byValueKey('sensor initialization date');
//     final lastCuttingDate = find.byValueKey('last cutting date');
//     final addSensorButton = find.byValueKey('add sensor');

//     FlutterDriver driver;

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });

//     test('sign up', () async {
//       await driver.tap(signUp);
//     });
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:farmadvisor/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('farm advisor app', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('Smart Farming'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('SIGN UP WITH AGINO');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('TERMS & CONDITIONS'), findsOneWidget);
    });
  });
}
