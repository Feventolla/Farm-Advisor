<<<<<<< Updated upstream
import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
=======
import 'package:farmadvisor/screens/Onboarding/landingpage.dart';
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Field(
          title: null,
        ));
=======
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
>>>>>>> Stashed changes
  }
}
