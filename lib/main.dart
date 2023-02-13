import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/widget.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newFarm.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newField.dart';
import 'package:farmadvisor/screens/FirstTimeUser/newSensor.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/reset.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
import 'package:farmadvisor/screens/Home/sensorHome.dart';
import 'package:farmadvisor/screens/Onboarding/landingpage.dart';
import 'package:farmadvisor/screens/Onboarding/login.dart';
import 'package:farmadvisor/screens/Onboarding/signin.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:farmadvisor/screens/Onboarding/verification.dart';
import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
import 'package:farmadvisor/screens/Onboarding/widgets/termtext.dart';
import 'package:flutter/material.dart';
import 'package:farmadvisor/screens/Dashboard/help.dart';
import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Home/home.dart';
import 'package:farmadvisor/screens/Home/FieldHome.dart';
import 'package:farmadvisor/screens/Dashboard/field.dart';
import 'package:farmadvisor/screens/Dashboard/profile.dart';
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
    final Field field;
    final _router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: LandingPage(
                    ))),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: Login())),
        GoRoute(
            path: '/signin',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: SignIn())),
        GoRoute(
            path: '/terms',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: TermsPage())),
        GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: Home())),
        GoRoute(
            path: '/addfarm',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: NewFarm())),
        GoRoute(
            path: '/fieldHome',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: FieldHome())),
        GoRoute(
            path: '/addfield',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: NewField())),
        GoRoute(
            path: '/sensorHome',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: SensorHome())),
        // GoRoute(
        //     path: '/addsensor',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: NewSensor())),
        GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: FarmDashboard())),
        GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: Profile())),
        // GoRoute(
        //     path: '/updatecourse',
        //     pageBuilder: (context, state) => MaterialPage(
        //         key: state.pageKey,
        //         child: Updatecourse(
        //           args: CourseArgument(edit: false),
        //         ))),
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
              MaterialPage(key: state.pageKey, child: FarmDashboard()),
          // routes: [
          //   GoRoute(
          //       path: ':id',
          //       pageBuilder: (context, state) {
          //         return MaterialPage(
          //             key: state.pageKey, child: Field(title: ""));
          //       })
          // ],
        ),
        // GoRoute(
        //     path: '/dashboard',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: Dashboard())),
        // GoRoute(
        //     path: '/watch_video',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: VideoDemo())),
        // GoRoute(
        //     path: '/error',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: Error())),
        // GoRoute(
        //     path: '/addcourse',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: FormApp())),
        // GoRoute(
        //     path: '/addquiz',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: QuizFormApp())),
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
