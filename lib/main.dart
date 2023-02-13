import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
import 'package:farmadvisor/screens/FirstTimeUser/new_farm.dart';
import 'package:farmadvisor/screens/FirstTimeUser/new_field.dart';
import 'package:farmadvisor/screens/FirstTimeUser/new_sensor.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Home/sensorHome.dart';
import 'package:farmadvisor/screens/Onboarding/landingpage.dart';
import 'package:farmadvisor/screens/Onboarding/login.dart';
import 'package:farmadvisor/screens/Onboarding/signin.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:farmadvisor/screens/Home/field_home.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const LandingPage())),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const Login())),
        GoRoute(
            path: '/signin',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const SignIn())),
        GoRoute(
            path: '/terms',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const TermsPage())),
        GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const Home())),
        GoRoute(
            path: '/addfarm',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const NewFarm())),
        GoRoute(
            path: '/fieldHome',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const FieldHome())),
        GoRoute(
            path: '/addfield',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const NewField())),
        GoRoute(
            path: '/sensorHome',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const SensorHome())),
        // GoRoute(
        //     path: '/addsensor',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: NewSensor())),
        GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const FarmDashboard())),
        GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const Profile())),

        GoRoute(
          path: '/fields/:id',
          name: 'fields',
          builder: ((context, state) => Field(
                id: state.params['id']!,
              )),
        ),
        GoRoute(
          path: '/field/:id',
          name: 'field',
          builder: ((context, state) => NewSensor(
                id: state.params['id']!,
              )),
          // pageBuilder: (context, state) {
          //   return MaterialPage(key: state.pageKey, child: Field(title: ""));
          // },
        ),

        GoRoute(
          path: '/farmdashboard',
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const FarmDashboard()),
        ),
      ],
    );

    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Farm Advisor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LandingPage()
      // TermsPage()
      // FarmDashboard()
      // HomePage(),
      // title: null,
    );
  }
}
