import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/widget.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/reset.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:flutter/material.dart';
import 'package:farmadvisor/screens/Dashboard/help.dart';

import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';

import 'package:farmadvisor/screens/Dashboard/profile.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // FarmDashboard()
            // HomePage(),
            TermsPage()
        //   Field(
        // title: null,
        );
  }
}
