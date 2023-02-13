// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter_driver/flutter_driver.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:integration_test/integration_test.dart';
// import 'package:test/test.dart';

// void main() {
//   // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('farm advisor app', () {
//     final signUp = find.byKey('sign up');
//     final signIn = find.byKey('sign in');
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

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:farmadvisor/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('farm advisor app', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(milliseconds: 2000), () {});

      expect(find.text('Smart Farming'), findsOneWidget);

      final Finder fab = find.byKey(const Key('sign up'));

      await tester.tap(fab);

      await tester.pumpAndSettle();

      expect(find.text('TERMS & CONDITIONS'), findsOneWidget);

      final Finder agree = find.byKey(const Key('terms'));

      await tester.tap(agree);

      await tester.pumpAndSettle();

      expect(find.text('SIGN UP'), findsOneWidget);

      final phoneNo = find.byKey(const Key('phone'));
      await tester.enterText(phoneNo, '0912345245');

      await tester.pumpAndSettle();

      final country = find.byKey(const Key('country'));
      await tester.enterText(country, 'Ethiopia');

      final Finder continues = find.byKey(const Key('signin'));

      await tester.tap(continues);
      await tester.pumpAndSettle();

      expect(find.text('Login with your phone number'), findsOneWidget);

      final Finder phone = find.byKey(Key('phoneNo'));

      await tester.enterText(phone, '0912345245');

      final login = find.byKey(Key('Continue'));
      await tester.tap(login);

      await tester.pumpAndSettle();

      expect(find.text('Wellcome to Agino'), findsOneWidget);

      final Finder newfarm = find.byKey(const Key('addfarm'));

      await tester.tap(newfarm);

      await tester.pumpAndSettle();

      expect(find.text('create new farm'), findsOneWidget);

      final farmName = find.byKey(const Key('name'));
      final location = find.byKey(const Key('location'));
      final addfarm = find.byKey(const Key('farm'));

      await tester.enterText(farmName, "new farm");

      await tester.enterText(location, 'addis ababa');

      await tester.tap(addfarm);

      await tester.pumpAndSettle();

      expect(find.text('Add a Field'), findsOneWidget);

      final Finder newfield = find.byKey(const Key('field'));

      await tester.tap(newfield);

      await tester.pumpAndSettle();

      expect(find.text('NEW FIELD'), findsOneWidget);

      final fieldName = find.byKey(Key('name'));
      final altitude = find.byKey(Key('altitude'));
      final addfield = find.byKey(Key('addfield'));

      await tester.enterText(fieldName, "new field");

      await tester.enterText(altitude, '1209');

      await tester.tap(addfield);

      await tester.pumpAndSettle();

      expect(find.text('Add a Sensor'), findsOneWidget);

      final newsensor = find.byKey(const Key('sensor'));

      await tester.tap(newsensor);

      await tester.pumpAndSettle();

      expect(find.text('Add a Sensor'), findsOneWidget);

      final sensorName = find.byKey(const Key('sensor name'));
      final serialNumber = find.byKey(const Key('serialNumber'));
      final sensorLocation = find.byKey(const Key('sensor location'));
      final ggd = find.byKey(const Key('GGD'));
      final installationDate = find.byKey(const Key('GGD'));
      final lastCutting = find.byKey(const Key('lastCutting'));
      final addsensor = find.byKey(const Key('addsensor'));

      await tester.enterText(sensorName, "new sensor");
      await tester.enterText(serialNumber, '1209nNNN');
      await tester.enterText(sensorLocation, "sebe");
      await tester.enterText(ggd, '348');
      await tester.enterText(installationDate, "8/8/2022");
      await tester.enterText(lastCutting, '9/9/2023');

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await tester.tap(addsensor);

      await tester.pumpAndSettle();
    });
  });
}
